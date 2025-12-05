{ pkgs
, nodejs ? pkgs.nodejs_20
, electron ? pkgs.electron_34
}:

let
  lib = pkgs.lib;
  product = builtins.fromJSON (builtins.readFile ../product.json);
  pkgJson = builtins.fromJSON (builtins.readFile ../package.json);

  npmCaches = import ./npm-deps.nix { inherit pkgs; };

  npmCacheUnion = pkgs.runCommand "void-npm-cache" {} ''
    mkdir -p $out
    for cache in ${lib.concatStringsSep " " (builtins.attrValues npmCaches)}; do
      if [ -d "$cache" ]; then
        cp -R --no-preserve=mode,ownership "$cache"/* $out/ || true
      fi
    done
  '';

  runtimeLibs = with pkgs; [
    alsa-lib
    at-spi2-atk
    at-spi2-core
    cairo
    cups
    dbus
    expat
    fontconfig
    freetype
    glib
    gtk3
    libdrm
    libnotify
    libpulseaudio
    libsecret
    libthai
    libxkbcommon
    xorg.libxkbfile
    mesa
    nspr
    nss
    pango
    udev
    xdg-utils
    zlib
    xorg.libX11
    xorg.libXau
    xorg.libxcb
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXi
    xorg.libXrandr
    xorg.libXrender
    xorg.libXScrnSaver
    xorg.libXtst
  ];

  rustCli = pkgs.rustPlatform.buildRustPackage {
    pname = "void-cli";
    version = pkgJson.version;
    src = lib.cleanSource ../cli;
    cargoLock = {
      lockFile = ../cli/Cargo.lock;
      outputHashes = {
        "russh-0.37.1" = "sha256-10sxPj3ulDd1XEUrTNyQTbxh5B4GCAvAt5LAqlDhgXo=";
        "russh-keys-0.37.1" = "sha256-10sxPj3ulDd1XEUrTNyQTbxh5B4GCAvAt5LAqlDhgXo=";
        "russh-cryptovec-0.7.0" = "sha256-10sxPj3ulDd1XEUrTNyQTbxh5B4GCAvAt5LAqlDhgXo=";
        "tunnels-0.1.0" = "sha256-uE/k4B3H6pLhiWl2K8f8Wqm2sBbnDDseexS5earENCE=";
      };
    };
    cargoHash = "sha256-DugRJZ+/yA6+XFNu3jKVuTMRlA3FA28GdrwwUKwk2S0=";
    nativeBuildInputs = [ pkgs.pkg-config ];
    buildInputs = [ pkgs.openssl pkgs.zlib ];
    # Provide version and product info to the build script so it doesn't need package.json/product.json in the source.
    VSCODE_CLI_VERSION = pkgJson.version;
    VSCODE_CLI_PRODUCT_JSON = ../product.json;
  };

  cleanedSrc = lib.cleanSourceWith {
    src = ../.;
    filter = path: type:
      let base = builtins.baseNameOf (toString path); in
      !(base == ".git" || base == ".build" || base == "target" || base == "node_modules");
  };
in
pkgs.stdenv.mkDerivation rec {
  pname = "void";
  version = product.voidVersion or pkgJson.version;

  src = cleanedSrc;

  nativeBuildInputs = with pkgs; [
    nodejs
    python3
    pkg-config
    git
    gnutar
    gzip
    gnupatch
    which
    ninja
    makeWrapper
  ];

  buildInputs = runtimeLibs ++ [
    pkgs.krb5
    pkgs.openssl
    pkgs.zlib
  ];

  NODE_OPTIONS = "--max-old-space-size=8192";

  buildPhase = ''
    runHook preBuild
    export HOME=$PWD/.home
    mkdir -p "$HOME"

    export npm_config_cache=${npmCacheUnion}
    export npm_config_offline=false
    export npm_config_legacy_peer_deps=true
    export npm_config_python=${pkgs.python3}/bin/python3
    export npm_config_nodedir=${electron}/lib/node_modules/electron
    export npm_execpath=${nodejs}/bin/npm
    export FORCE_GIT_DEPS=1
    export FORCE_EMPTY_CACHE=1
    export PLAYWRIGHT_BROWSERS_PATH=0
    export ELECTRON_OVERRIDE_DIST_PATH=${electron}/lib/electron
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export VSCODE_SKIP_NODE_VERSION_CHECK=1

    export PATH=$PWD/node_modules/.bin:$PATH

    node build/npm/preinstall.js
    node build/npm/postinstall.js

    npm run gulp compile
    npm run gulp vscode-linux-x64-min
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin $out/share/applications $out/share/icons/hicolor/256x256/apps $out/share/icons/hicolor/512x512/apps $out/share/void

    cp -R VSCode-linux-x64/* $out/share/void/

    makeWrapper $out/share/void/bin/void $out/bin/void \
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath runtimeLibs}" \
      --prefix PATH : "${lib.makeBinPath [ pkgs.git pkgs.xdg-utils rustCli ]}" \
      --set ELECTRON_FORCE_IS_PACKAGED 1

    ln -s ${rustCli}/bin/code $out/bin/void-cli

    cp ../resources/linux/code.desktop $out/share/applications/${product.applicationName}.desktop
    substituteInPlace $out/share/applications/${product.applicationName}.desktop \
      --replace "@@NAME_LONG@@" "${product.nameLong}" \
      --replace "@@NAME_SHORT@@" "${product.nameShort}" \
      --replace "@@NAME@@" "${product.applicationName}" \
      --replace "@@EXEC@@" "$out/bin/void" \
      --replace "@@ICON@@" "${product.linuxIconName}" \
      --replace "@@URLPROTOCOL@@" "${product.urlProtocol}" \
      --replace "@@LICENSE@@" "${product.licenseName}"

    cp ../resources/linux/code-url-handler.desktop $out/share/applications/${product.applicationName}-url-handler.desktop
    substituteInPlace $out/share/applications/${product.applicationName}-url-handler.desktop \
      --replace "@@NAME_LONG@@" "${product.nameLong}" \
      --replace "@@NAME_SHORT@@" "${product.nameShort}" \
      --replace "@@NAME@@" "${product.applicationName}" \
      --replace "@@EXEC@@" "$out/bin/void" \
      --replace "@@ICON@@" "${product.linuxIconName}" \
      --replace "@@URLPROTOCOL@@" "${product.urlProtocol}"

    cp ../resources/linux/code.appdata.xml $out/share/applications/${product.applicationName}.appdata.xml
    substituteInPlace $out/share/applications/${product.applicationName}.appdata.xml \
      --replace "@@NAME_LONG@@" "${product.nameLong}" \
      --replace "@@NAME@@" "${product.applicationName}" \
      --replace "@@LICENSE@@" "${product.licenseName}"

    cp ../resources/linux/code-workspace.xml $out/share/applications/${product.applicationName}-workspace.xml
    substituteInPlace $out/share/applications/${product.applicationName}-workspace.xml \
      --replace "@@NAME_LONG@@" "${product.nameLong}" \
      --replace "@@NAME@@" "${product.applicationName}"

    mkdir -p $out/share/bash-completion/completions
    cp ../resources/completions/bash/code $out/share/bash-completion/completions/${product.applicationName}
    substituteInPlace $out/share/bash-completion/completions/${product.applicationName} \
      --replace "@@APPNAME@@" "${product.applicationName}"

    mkdir -p $out/share/zsh/site-functions
    cp ../resources/completions/zsh/_code $out/share/zsh/site-functions/_${product.applicationName}
    substituteInPlace $out/share/zsh/site-functions/_${product.applicationName} \
      --replace "@@APPNAME@@" "${product.applicationName}"

    install -Dm644 ../resources/linux/code.png $out/share/icons/hicolor/256x256/apps/${product.linuxIconName}.png
    cp $out/share/icons/hicolor/256x256/apps/${product.linuxIconName}.png $out/share/icons/hicolor/512x512/apps/${product.linuxIconName}.png

    runHook postInstall
  '';

  meta = with lib; {
    description = "Void (open-source Cursor alternative) packaged with Nix";
    homepage = "https://voideditor.com";
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
    mainProgram = "void";
  };
}


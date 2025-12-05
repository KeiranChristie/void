{ pkgs }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs_20
    python3
    git
    gcc
    gnumake
    pkg-config
    electron_34
    openssl
    zlib
    libsecret
    libxkbfile
    xorg.libX11
    xorg.libxcb
    cargo
    rustc
  ];

  shellHook = ''
    export NODE_OPTIONS="--max-old-space-size=8192"
    echo "Node version: $(node -v) (expected v20.18.2)"
  '';
}


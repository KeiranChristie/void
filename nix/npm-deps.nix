{ pkgs }:

let
  mk = lockfile: hash:
    pkgs.fetchNpmDeps {
      inherit hash;
      src = ../.;
      inherit lockfile;
      forceGitDeps = true;
      forceEmptyCache = true;
    };
in
{
  root = mk ../package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  build = mk ../build/package-lock.json "sha256-HKVzkEkkLMq5ZgE5+rB3APn0Z2XepmGUZUL62eXCMV8=";
  buildGyp = mk ../build/npm/gyp/package-lock.json "sha256-eG2bE30drub5sQ9qvgfx2U/JueAXsQLM5bM4uqsN38w=";
  extensions = mk ../extensions/package-lock.json "sha256-TGEHqNAfwXF81ftxttxTkpUpYRBKvqzjji5VV0KCbBs=";
  extensionsConfigurationEditing = mk ../extensions/configuration-editing/package-lock.json "sha256-/XrKa3y2bBcDY9VMn8C35VlN40IbVg+FAxtNKqdnNSM=";
  extensionsCssLanguageFeatures = mk ../extensions/css-language-features/package-lock.json "sha256-WuDPEeWOxosglJqgK+BO7RjWz6pVFBSLBoK/rxkknWQ=";
  extensionsCssLanguageFeaturesServer = mk ../extensions/css-language-features/server/package-lock.json "sha256-4wRaE1q7EacCzfoaySyF94zTFyROs7aIE6GJU5/azdY=";
  extensionsDebugAutoLaunch = mk ../extensions/debug-auto-launch/package-lock.json "sha256-wSBZc6/1aTvo1ED1HR/rjVoO+tYJKoiWTjxNG6q5wR4=";
  extensionsDebugServerReady = mk ../extensions/debug-server-ready/package-lock.json "sha256-Dgp/vM8nxMqcoaco+BK0IW1LyOfikd1ycqE+0XjoI68=";
  extensionsEmmet = mk ../extensions/emmet/package-lock.json "sha256-BNseZW9q4psBfLjrxo0m/SAfKwq0k9P/a/qKw+wxqXc=";
  extensionsExtensionEditing = mk ../extensions/extension-editing/package-lock.json "sha256-OOGZRShuPfohBk6HohKA3bRf5GuG9BZObm2Y4OCqNhY=";
  extensionsGit = mk ../extensions/git/package-lock.json "sha256-34otgEN62oijcJOdtwr81JsVejbALOR2bLWgQ6YUhUU=";
  extensionsGitBase = mk ../extensions/git-base/package-lock.json "sha256-coGnGFgMlR0gs0DrhtrJ/W5sJ7NocY7f3kwwewPHZb4=";
  extensionsGithub = mk ../extensions/github/package-lock.json "sha256-GM4dSdlRZCmSKMd6Q0WSkCuOHWS5ZeWB/kY/lu2cILU=";
  extensionsGithubAuthentication = mk ../extensions/github-authentication/package-lock.json "sha256-7icHdk1K4cIlF/kQkX8BnAkRTarXebv7VpUBOMaW1t4=";
  extensionsGrunt = mk ../extensions/grunt/package-lock.json "sha256-cytMJnJD+uLGf7+1/D3YMrB8PHF7B4cC9IPfCgBsGww=";
  extensionsGulp = mk ../extensions/gulp/package-lock.json "sha256-vi8NJNDJjfoRLjsDT891NE7sXBJoIq/KoZ/4zKMqagk=";
  extensionsHtmlLanguageFeatures = mk ../extensions/html-language-features/package-lock.json "sha256-hBj8FoNaiNuS+uRMPIz1L3Ty5VGTFhKjsL+Cwzk0uPk=";
  extensionsHtmlLanguageFeaturesServer = mk ../extensions/html-language-features/server/package-lock.json "sha256-JZRdCrlFiZmZ7e7tGu0qsPTtCuUxzs65fJ91E6x6DCU=";
  extensionsIpynb = mk ../extensions/ipynb/package-lock.json "sha256-bdV4o46P2UFY+liMPtpwAPD2nQMpoOk7Sz8oQZWK24g=";
  extensionsJake = mk ../extensions/jake/package-lock.json "sha256-vTkw/QkYkuoarD+ietUGKpX1ypCTYDOcwyFuMeqhvOc=";
  extensionsJsonLanguageFeatures = mk ../extensions/json-language-features/package-lock.json "sha256-fvpaOBM10WIlsn/jyk1fF2x1Dh+DmLGsOxlMOG5551I=";
  extensionsJsonLanguageFeaturesServer = mk ../extensions/json-language-features/server/package-lock.json "sha256-VUHK3yOww8WlBy0PI6lbERyfULaickkh/mU8qqFbU7E=";
  extensionsMarkdownLanguageFeatures = mk ../extensions/markdown-language-features/package-lock.json "sha256-uYoFUEzmrXKvrt4D3QtmXRb3tLTpLaYyYqZlJW65D58=";
  extensionsMarkdownMath = mk ../extensions/markdown-math/package-lock.json "sha256-f7trHpw4OrofHZ79MdnfNJd1ZHlmtIHd9iCI+cNac0k=";
  extensionsMediaPreview = mk ../extensions/media-preview/package-lock.json "sha256-oHSfamtY1/2+f2T4qShpw0dl9Hv3af+ygj4bTJ0wUMA=";
  extensionsMergeConflict = mk ../extensions/merge-conflict/package-lock.json "sha256-ynUV74+7iTTxRN0JQAUXiecp2HtJ4X53HI7nSJRMNHs=";
  extensionsMicrosoftAuthentication = mk ../extensions/microsoft-authentication/package-lock.json "sha256-sDR7AaC0mFE95/gsCOab3CQzvOlAUIlcrsI4fu32fAI=";
  extensionsNotebookRenderers = mk ../extensions/notebook-renderers/package-lock.json "sha256-vHmdXBCA3XLwrOqY+TkKHY/hfQvc+9n0YA5xeYvprhQ=";
  extensionsNpm = mk ../extensions/npm/package-lock.json "sha256-Y/yrvfafNhEi4AB78ydlrb5BTJa3JFOKPtSZexBgQMo=";
  extensionsOpenRemoteSsh = mk ../extensions/open-remote-ssh/package-lock.json "sha256-TkOlcI065tObF5L//KwSEeIQAVnKqJjfNqyJ2J9frOo=";
  extensionsOpenRemoteWsl = mk ../extensions/open-remote-wsl/package-lock.json "sha256-r+ehcILPT9SIUka0olZDsohQjF7noWIe/gNeEfssl5Q=";
  extensionsPhpLanguageFeatures = mk ../extensions/php-language-features/package-lock.json "sha256-B/Dpwq0fGdsPEXfIgAyLxz2GsvV5hsFEFkZRl5siuOk=";
  extensionsReferencesView = mk ../extensions/references-view/package-lock.json "sha256-UI0FSW9+OTWUXIBi/rL2iMDxlam0WtwDXWwvaOWt+ag=";
  extensionsSearchResult = mk ../extensions/search-result/package-lock.json "sha256-Nb1I3qSrOrjTxw7PBEK4BnyoJknC1iIt2CfkiEmo3RI=";
  extensionsSimpleBrowser = mk ../extensions/simple-browser/package-lock.json "sha256-DTHZIddI9TsHgypEAP6EoC5kHAenabv10xVv3nsd66A=";
  extensionsTerminalSuggest = mk ../extensions/terminal-suggest/package-lock.json "sha256-DNVAxmT+lyObm99rsldQpi6FE8qFADrg6v7Y4eLKUO0=";
  extensionsTunnelForwarding = mk ../extensions/tunnel-forwarding/package-lock.json "sha256-LngWoia6J+8YCVc1eSfHhH+/SBm80OG0Y2pi7PcqzmQ=";
  extensionsTypescriptLanguageFeatures = mk ../extensions/typescript-language-features/package-lock.json "sha256-2psyMVHZ3u7WjtuAP+nx7+cskQMc59rgi9sCu6TDKbc=";
  extensionsVscodeApiTests = mk ../extensions/vscode-api-tests/package-lock.json "sha256-9X6A+heX9KMoLiM/c3OI0vkRMpUAFJX7lNO2f1G+hrE=";
  extensionsVscodeColorizePerfTests = mk ../extensions/vscode-colorize-perf-tests/package-lock.json "sha256-jCdW/BIl2lSW/12CgPN9iF5aJjYT0qtQnYZICKXoT6k=";
  extensionsVscodeColorizeTests = mk ../extensions/vscode-colorize-tests/package-lock.json "sha256-prp6rSI9Nrr0uWwNaU4TeFNG8MZ1iNH6OxFGx8eeC0g=";
  extensionsVscodeTestResolver = mk ../extensions/vscode-test-resolver/package-lock.json "sha256-lr4Xw9YvRwRAGjVhkPJqvGkIWF6nWeGBNQwy6z2ahRc=";
  remote = mk ../remote/package-lock.json "sha256-IrMiteDLD6e6T/AEJLse/f6JTz7BX+ixwEdTtnBWc04=";
  remoteWeb = mk ../remote/web/package-lock.json "sha256-ISG7Jg6qXNYEN7eaYc4Aa5dqObAV6IWTj47/x9fSI/c=";
  testAutomation = mk ../test/automation/package-lock.json "sha256-5/UxT0ioXUvcZUfPza5ccaHLa92m6RFMLoRkcdBwdIE=";
  testIntegrationBrowser = mk ../test/integration/browser/package-lock.json "sha256-hbuyJP0NqW6LQMcZqWDEL83/xyVcDTcRDMD6wHMpB/0=";
  testMonaco = mk ../test/monaco/package-lock.json "sha256-I8up5aJ23845gPe2neJ0ktttBQCsKbM/0hm1Qo/Zrac=";
  testSmoke = mk ../test/smoke/package-lock.json "sha256-b67Ho/2WXr9J8wD+c+noIqxqOAGcbPangRdzc0uRAiU=";
  vscodeSelfhostImportAid = mk ../.vscode/extensions/vscode-selfhost-import-aid/package-lock.json "sha256-i1D4iJnowl/6v80FmjrmSgaM2dHG0iat9ATLjp3qCwM=";
  vscodeSelfhostTestProvider = mk ../.vscode/extensions/vscode-selfhost-test-provider/package-lock.json "sha256-g8JonTblxAWx31dJuMa11Ie6wscN/kxGZ4LoQd5PQ+8=";
}


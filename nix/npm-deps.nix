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
  build = mk ../build/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  buildGyp = mk ../build/npm/gyp/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensions = mk ../extensions/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsConfigurationEditing = mk ../extensions/configuration-editing/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsCssLanguageFeatures = mk ../extensions/css-language-features/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsCssLanguageFeaturesServer = mk ../extensions/css-language-features/server/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsDebugAutoLaunch = mk ../extensions/debug-auto-launch/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsDebugServerReady = mk ../extensions/debug-server-ready/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsEmmet = mk ../extensions/emmet/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsExtensionEditing = mk ../extensions/extension-editing/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsGit = mk ../extensions/git/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsGitBase = mk ../extensions/git-base/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsGithub = mk ../extensions/github/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsGithubAuthentication = mk ../extensions/github-authentication/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsGrunt = mk ../extensions/grunt/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsGulp = mk ../extensions/gulp/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsHtmlLanguageFeatures = mk ../extensions/html-language-features/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsHtmlLanguageFeaturesServer = mk ../extensions/html-language-features/server/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsIpynb = mk ../extensions/ipynb/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsJake = mk ../extensions/jake/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsJsonLanguageFeatures = mk ../extensions/json-language-features/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsJsonLanguageFeaturesServer = mk ../extensions/json-language-features/server/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsMarkdownLanguageFeatures = mk ../extensions/markdown-language-features/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsMarkdownMath = mk ../extensions/markdown-math/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsMediaPreview = mk ../extensions/media-preview/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsMergeConflict = mk ../extensions/merge-conflict/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsMicrosoftAuthentication = mk ../extensions/microsoft-authentication/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsNotebookRenderers = mk ../extensions/notebook-renderers/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsNpm = mk ../extensions/npm/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsOpenRemoteSsh = mk ../extensions/open-remote-ssh/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsOpenRemoteWsl = mk ../extensions/open-remote-wsl/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsPhpLanguageFeatures = mk ../extensions/php-language-features/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsReferencesView = mk ../extensions/references-view/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsSearchResult = mk ../extensions/search-result/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsSimpleBrowser = mk ../extensions/simple-browser/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsTerminalSuggest = mk ../extensions/terminal-suggest/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsTunnelForwarding = mk ../extensions/tunnel-forwarding/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsTypescriptLanguageFeatures = mk ../extensions/typescript-language-features/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsVscodeApiTests = mk ../extensions/vscode-api-tests/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsVscodeColorizePerfTests = mk ../extensions/vscode-colorize-perf-tests/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsVscodeColorizeTests = mk ../extensions/vscode-colorize-tests/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  extensionsVscodeTestResolver = mk ../extensions/vscode-test-resolver/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  remote = mk ../remote/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  remoteWeb = mk ../remote/web/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  testAutomation = mk ../test/automation/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  testIntegrationBrowser = mk ../test/integration/browser/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  testMonaco = mk ../test/monaco/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  testSmoke = mk ../test/smoke/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  vscodeSelfhostImportAid = mk ../.vscode/extensions/vscode-selfhost-import-aid/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
  vscodeSelfhostTestProvider = mk ../.vscode/extensions/vscode-selfhost-test-provider/package-lock.json "sha256-WI0zKLNOVdW/vmQxoc9jXkkHvavg1JaXOHEOwpYnJ9A=";
}


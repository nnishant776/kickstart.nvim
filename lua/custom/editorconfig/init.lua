-- parse vscode workspace settings

local default_cfg = {
  files = {
    exclude = {
      ['**/.cache/**'] = true,
    },
    trimFinalNewlines = false,
    trimTrailingWhitespace = false,
  },
  window = {
    filename = 'base', -- possible values: base, rootrel
  },
  editor = {
    formatOnPaste = false,
    formatOnSave = false,
    insertSpaces = false,
    tabSize = 8,
    detectIndentation = false,
    cursorSmoothCaretAnimation = false,
    renderWhitespace = 'all',
    lineNumbers = 'relative',
    showPosition = false,
    highlightLine = false,
    wordWrap = "bounded",
    wordWrapColumn = 120,
    rulers = {
      9999,
    },
    suggestOnTriggerCharacters = false,
    guides = {
      indentation = false,
      context = false,
      highlightActiveBracketPair = false,
      highlightActiveIndentation = false,
      bracketPairs = false,
      bracketPairsHorizontal = false,
    },
    inlayHints = {
      enabled = 'off',
    },
    wordBasedSuggestions = false,
    quickSuggestions = {
      other = 'off',
      comments = 'off',
      strings = 'off',
    },
    suggest = {
      enabled = false,
      showWords = false,
      showSnippets = true,
      showFiles = true,
      preview = true,
      insertMode = 'replace',
      filterGraceful = false,
    },
  },
}

if vim.g.parse_external_editor_config then
  return require('custom.editorconfig.vscode').parse_config(default_cfg)
else
  return default_cfg
end

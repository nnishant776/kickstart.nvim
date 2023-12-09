-- This file is automatically loaded by plugins.core
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

local function load(cfg)
  -- Global settings
  vim.opt.ruler = false
  vim.opt.foldlevel = 99
  vim.opt.numberwidth = 4
  vim.opt.formatoptions = "jcqrlont"
  vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
  vim.opt.autowrite = true
  vim.opt.timeoutlen = 1000
  vim.opt.updatetime = 250
  vim.opt.backspace = { "indent", "eol", "start" }
  vim.opt.ttyfast = true
  vim.opt.cmdheight = 1
  vim.opt.lazyredraw = true
  vim.opt.modelines = 1
  vim.opt.swapfile = false
  vim.opt.clipboard = ""
  vim.opt.incsearch = false
  vim.opt.conceallevel = 3
  vim.opt.confirm = true
  vim.opt.grepformat = "%f:%l:%c:%m"
  vim.opt.grepprg = "rg --vimgrep"
  vim.opt.inccommand = "nosplit"
  vim.opt.laststatus = 3
  vim.opt.mouse = "a"
  vim.opt.pumblend = 10
  vim.opt.pumheight = 10
  vim.opt.scrolloff = 5
  vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
  vim.opt.shiftround = true
  vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
  vim.opt.showmode = false
  vim.opt.sidescrolloff = 8
  vim.opt.signcolumn = "yes"
  vim.o.ignorecase = true
  vim.opt.smartcase = true
  vim.opt.smartindent = true
  vim.opt.spelllang = { "en" }
  vim.opt.splitbelow = true
  vim.opt.splitkeep = "screen"
  vim.opt.splitright = true
  vim.opt.termguicolors = true
  vim.opt.undofile = true
  vim.opt.undolevels = 10000
  vim.opt.virtualedit = "block"
  vim.opt.wildmode = "longest:full,full"
  vim.opt.winminwidth = 5
  vim.opt.listchars = {
    trail = '·',
    tab = "➝ ",
    lead = '·',
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
  }

  -- Configurable settings
  vim.opt.shiftwidth = cfg.editor.tabSize
  vim.opt.tabstop = cfg.editor.tabSize
  vim.opt.softtabstop = cfg.editor.tabSize
  vim.opt.expandtab = cfg.editor.insertSpaces
  vim.opt.number = cfg.editor.lineNumbers ~= "off"
  vim.opt.relativenumber = cfg.editor.lineNumbers == "relative"
  vim.opt.list = cfg.editor.renderWhitespace ~= "none"
  vim.opt.cursorline = cfg.editor.highlightLine
  vim.opt.autoindent = cfg.editor.detectIndentation
  vim.opt.colorcolumn = cfg.editor.rulers
  vim.opt.wrap = cfg.editor.wordWrap ~= ""
  vim.opt.wrapmargin = cfg.editor.wordWrapColumn
  vim.opt.textwidth = cfg.editor.wordWrapColumn
  if vim.fn.has("nvim-0.10") == 1 then
    vim.opt.smoothscroll = cfg.editor.cursorSmoothCaretAnimation
  end
end

local function load_buf(cfg, buf_nr)
  vim.bo[buf_nr].shiftwidth = cfg.editor.tabSize
  vim.bo[buf_nr].tabstop = cfg.editor.tabSize
  vim.bo[buf_nr].softtabstop = cfg.editor.tabSize
  vim.bo[buf_nr].expandtab = cfg.editor.insertSpaces
  vim.bo[buf_nr].autoindent = cfg.editor.detectIndentation
  vim.bo[buf_nr].wrapmargin = cfg.editor.wordWrapColumn
  vim.bo[buf_nr].textwidth = cfg.editor.wordWrapColumn
  vim.g.indent_blankline_enabled = cfg.editor.guides.indentation
end
local M = {}

M.load = load
M.load_buf = load_buf

return M

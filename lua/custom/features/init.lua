local function init_feature_sets(editorconfig)
  local feature_sets = {
    minimal = {
      plugins = {
        {
          'navarasu/onedark.nvim',
          priority = 1000,
          opts = {
            toggle_style_key = '<leader>tt',
            toggle_style_list = { 'dark', 'light' },
          },
          config = function(_, opts)
            require('onedark').setup(opts)
            vim.cmd.colorscheme 'onedark'
          end,
        },
        { 'nvim-tree/nvim-web-devicons' },
        { 'tpope/vim-fugitive',                  enabled = false },
        { 'tpope/vim-sleuth',                    enabled = false },
        { 'tpope/vim-rhubarb',                   enabled = false },
        { 'lukas-reineke/indent-blankline.nvim', enabled = false },
        { 'nvim-treesitter/nvim-treesitter',     enabled = false },
        { 'lewis6991/gitsigns.nvim',             enabled = false },
        { 'williamboman/mason.nvim',             enabled = false },
        { 'neovim/nvim-lspconfig',               enabled = false },
        { 'rafamadriz/friendly-snippets',        enabled = false },
        { 'hrsh7th/nvim-cmp',                    enabled = false },
        { 'nvim-treesitter/playground',          enabled = false },
        { 'goolord/alpha-nvim',                  enabled = false },
        { 'numToStr/Comment.nvim',               enabled = false },
        { 'nvim-telescope/telescope.nvim',       enabled = false },
        { 'folke/which-key.nvim',                enabled = false },
	{ 'nvim-lua/plenary.nvim',               enabled = false },
      	-- { 'nvim-telescope/telescope-fzf-native.nvim', enabled = false },
      	-- { 'nvim-treesitter/nvim-treesitter-textobjects', enabled = false },
      	-- { 'nvim-treesitter/nvim-treesitter-textobjects', enabled = false },
      	-- { 'L3MON4D3/LuaSnip',         enabled = false },
      	-- { 'saadparwaiz1/cmp_luasnip', enabled = false },
      	-- { 'saadparwaiz1/cmp_luasnip', enabled = false },
      	-- { 'rafamadriz/friendly-snippets', enabled = false },
      },
    },
    default = {
      plugins = {},
    },
    ide = {
      plugins = {},
    },
    all = {
      plugins = {},
    },
  }

  return feature_sets
end

local M = {}

local function parse_features()
  local env_features = os.getenv 'features'
  local active_feature_set = {
    plugins = {},
    editorconfig = {},
  }
  local feature_list = {
    default = true,
    minimal = false,
    ide = false,
    all = false,
  }

  if env_features ~= '' then
    local features = vim.split(env_features, ',')
    for _, feat in ipairs(features) do
      if feat == 'minimal' then
        feature_list.minimal = true
        feature_list.default = false
        feature_list.ide = false
      elseif feat == 'all' then
        feature_list.default = false
        feature_list.ide = true
        feature_list.all = true
        vim.g.parse_external_editor_config = true
      elseif feat == 'ide' then
        feature_list.ide = true
        feature_list.default = false
      end

      if feat == 'extconfig' then
        vim.g.parse_external_editor_config = true
      end
    end
  end

  active_feature_set.editorconfig = require('custom.editorconfig')

  local feature_sets = init_feature_sets(active_feature_set.editorconfig)

  if feature_list.all then
    active_feature_set.plugins = feature_sets.all.plugins
  elseif feature_list.ide then
    active_feature_set.plugins = feature_sets.ide.plugins
  elseif feature_list.minimal then
    active_feature_set.plugins = feature_sets.minimal.plugins
    active_feature_set.editorconfig.editor.lineNumbers = 'off'
    active_feature_set.editorconfig.editor.showPosition = false
    active_feature_set.editorconfig.editor.renderWhitespace = 'none'
    active_feature_set.editorconfig.editor.insertSpaces = true
    active_feature_set.editorconfig.editor.highlightLine = false
  else
    active_feature_set.plugins = feature_sets.default.plugins
  end

  return feature_list, active_feature_set
end

M.parse_feature = parse_features

return M

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end

	return false
end

local packer_bootstrap = ensure_packer()

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- packer itself
	use("nvim-lua/plenary.nvim") -- required for many plugins as a dependency

	-- ===================================
	-- colorschemes
	-- ===================================
	use("catppuccin/nvim")

	-- ===================================
	-- git
	-- ===================================
	use("lewis6991/gitsigns.nvim")
	use("f-person/git-blame.nvim")
	use("sindrets/diffview.nvim")

	-- ===================================
	-- navigation
	-- ===================================
	use("ggandor/leap.nvim")
	use("ThePrimeagen/harpoon")
	use("nvim-tree/nvim-tree.lua")
	use("petertriho/nvim-scrollbar")
	use("christoomey/vim-tmux-navigator")

	-- ===================================
	-- utility
	-- ===================================
	use("nvim-lualine/lualine.nvim")
	use("folke/which-key.nvim")
	use("rcarriga/nvim-notify")
	use("szw/vim-maximizer")
	use("windwp/nvim-autopairs")
	use("kylechui/nvim-surround")
	use("kyazdani42/nvim-web-devicons")
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
	use({ "akinsho/toggleterm.nvim", tag = "*" })
	use("lukas-reineke/indent-blankline.nvim")
	use("numToStr/Comment.nvim")

	-- ===================================
	-- search
	-- ===================================
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	use("nvim-pack/nvim-spectre")
	use("kevinhwang91/nvim-hlslens")

	-- ===================================
	-- autocompletion & snippets
	-- ===================================
	use("hrsh7th/nvim-cmp") -- autocompletion plugin
	use("hrsh7th/cmp-path") -- autocompleteion source for file system paths
	use("saadparwaiz1/cmp_luasnip") -- connect autocompletion and snippet plugins
	use("rafamadriz/friendly-snippets")
	use({
		"L3MON4D3/LuaSnip",
		tag = "v2.*",
		run = "make install_jsregexp",
	})

	-- ===================================
	-- lsp
	-- ===================================
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("folke/trouble.nvim")
	use("lewis6991/hover.nvim")
	use("weilbith/nvim-code-action-menu")
	use("kosayoda/nvim-lightbulb")
	use("lukas-reineke/lsp-format.nvim")
	use("jose-elias-alvarez/typescript.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- packer bootstrap
	-- should be after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)

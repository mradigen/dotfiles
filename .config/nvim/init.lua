-- 1. BASIC OPTIONS
-- =================
-- Enable mouse support in all modes
vim.opt.mouse = 'a'

-- Sync with system clipboard (requires xclip/xsel on Linux)
vim.opt.clipboard = 'unnamedplus'

-- Basic UI settings for a better experience
vim.opt.number = true         -- Show line numbers
vim.opt.signcolumn = "yes"    -- Keep sign column open to prevent shifting
vim.opt.tabstop = 4           -- 2 spaces for tabs
vim.opt.shiftwidth = 4        -- 2 spaces for indentation
vim.opt.expandtab = false      -- Use spaces instead of tabs
vim.opt.swapfile = false
vim.opt.autoread = true


-- 2. PLUGIN MANAGER (LAZY.NVIM)
-- =============================
-- Auto-install lazy.nvim if not present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Setup Plugins
require("lazy").setup({
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000, -- Load this before all other plugins
		config = function()
			-- Optional: Configure the flavor (latte, frappe, macchiato, mocha)
			require("catppuccin").setup({ flavour = "mocha" })
			vim.cmd.colorscheme "catppuccin"
		end,
	},
	-- Auto-formatting plugin
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			-- Define your formatters here
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				python = { "isort", "black" },
				-- Use the "*" filetype to run formatters on all filetypes.
				-- ["*"] = { "codespell" },
				-- Use the "_" filetype to run formatters on filetypes that don't
				-- have other formatters configured.
				-- ["_"] = { "trim_whitespace" },
			},
			-- Format on save
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
		},
	},
	{
		'mg979/vim-visual-multi',
		branch = 'master',
		init = function()
			-- specific configuration will go here
		end
	}
})


-- 3. KEYMAPPINGS
-- ==============
-- Set <Space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- === COMMENTING ===
-- Neovim 0.10+ native commenting (gcc = line, gc = selection)

-- 1. Space + /
map('n', '<leader>/', 'gcc', { remap = true, desc = 'Toggle Comment Line' })
map('v', '<leader>/', 'gc', { remap = true, desc = 'Toggle Comment Selection' })

-- 2. Ctrl + / 
-- Note: Some terminals send <C-/> as <C-_> so we map both for safety.
map('n', '<C-/>', 'gcc', { remap = true, desc = 'Toggle Comment Line' })
map('v', '<C-/>', 'gc', { remap = true, desc = 'Toggle Comment Selection' })

map('n', '<C-_>', 'gcc', { remap = true, desc = 'Toggle Comment Line' })
map('v', '<C-_>', 'gc', { remap = true, desc = 'Toggle Comment Selection' })

-- Enable persistent undo
vim.opt.undofile = true

-- Save undo history to an undo file
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
-- Stay in visual mode after indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>wq", ":wq<CR>")

map('n', '<C-d>', '<C-n>', { remap = true, desc = 'Find Under' })
map('v', '<C-d>', '<C-n>', { remap = true, desc = 'Find Subword Under' })
map('n', '<M-S-Down>', '<C-Down>', { remap = true, desc = 'Select Cursor Down' })
map('n', '<M-S-Up>', '<C-Up>', { remap = true, desc = 'Select Cursor Up' })

map('n', '<C-s>', ':w<CR>', { remap = true, desc = 'Save' })

-- Alacritty --

-- Create a group to prevent duplicating autocommands on reload
local alacritty_group = vim.api.nvim_create_augroup('AlacrittyPadding', { clear = true })

-- 1. Remove padding on startup (Async)
vim.api.nvim_create_autocmd('VimEnter', {
    group = alacritty_group,
    callback = function()
        -- Use jobstart for async execution
        -- Syntax: alacritty msg config window.padding.x=0 window.padding.y=0
        vim.fn.jobstart(
            { 'alacritty', 'msg', 'config', 'window.padding.x=0', 'window.padding.y=0' },
            { detach = true }
        )
    end,
})

-- 2. Reset config on exit (Async)
vim.api.nvim_create_autocmd('VimLeavePre', {
    group = alacritty_group,
    callback = function()
        -- Syntax: alacritty msg config -r
        vim.fn.jobstart(
            { 'alacritty', 'msg', 'config', '-r' },
            { detach = true }
        )
    end,
})

-------------
-- Neovide --
-------------
if vim.g.neovide then
	-- vim.o.guifont = "Iosevka NF:h12.5"
	vim.o.guifont = "Iosevka NF:h9"
	-- vim.g.neovide_transparency = 0.6
	vim.g.neovide_cursor_trail_size = 0.7
	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_scroll_animation_length = 0.2
	vim.g.neovide_floating_shadow = true
	vim.g.neovide_floating_z_height = 10
	-- vim.g.neovide_light_angle_degrees = 45
	vim.g.neovide_light_radius = 12
end

-------------
-- Plugins --
-------------
local plugins = {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
					"zsh"
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- messages = {
			--   enabled = false -- view for warnings
			-- }
			-- add any options here
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 100,
			render = "minimal",
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				-- lua stuff
				"lua-language-server",
				"bash-language-server",

				-- web dev stuff
				-- "deno",
				"prettier",
				"html-lsp",
				"css-lsp",
				"typescript-language-server",
				"tailwindcss-language-server",
				"svelte-language-server",
				"astro-language-server"
			}
		}
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local lspconfig = require("lspconfig")
			-- local on_attach = require("plugins.configs.lspconfig").on_attach
			-- local capabilities = require("plugins.configs.lspconfig").capabilities

			local servers = {
				"html",
				"cssls",
				"tsserver",
				"bashls",
				"tailwindcss",
				"svelte",
				"astro",
				"pylsp"
			}

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup {
					-- This NvChad thing fucks shit up
					-- on_attach = on_attach, -- This adds LSP code actions
					-- capabilities = capabilities,
				}
			end
		end,
		lazy = false
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			formatters_by_ft = {
				["*"] = { "prettier" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = true,
				timeout_ms = 1000,
			},
		},
	},
	{
		"mg979/vim-visual-multi",
		lazy = false,
	},
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				-- web dev
				"html",
				"css",
				"typescript",
				"bash",
				"astro",
				"svelte",
			},
			autotag = {
				enable = true,
			},
		},
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {},
		lazy = false
	},
	{
		"hrsh7th/nvim-cmp",
		opts = {
			mapping = {
				["<CR>"] = require("cmp").config.disable,
				["<C-CR>"] = require("cmp").mapping.confirm {
					behavior = require("cmp").ConfirmBehavior.Insert,
					select = true,
				},
			},
			completion = {
				completeopt = "menu,menuone,noselect",
			}
		},
	}
}

return plugins

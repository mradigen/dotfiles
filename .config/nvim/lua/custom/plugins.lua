-------------
-- Neovide --
-------------
if vim.g.neovide then
	vim.o.guifont = "Iosevka NF:h9"
	-- vim.o.guifont = "Iosevka NF:h9"
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
	-- {
	-- 	"echasnovski/mini.indentscope",
	-- 	version = false, -- wait till new 0.7.0 release to put it back on semver
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	opts = {
	-- 		symbol = "│",
	-- 		options = { try_as_border = true },
	-- 	},
	-- 	init = function()
	-- 		vim.api.nvim_create_autocmd("FileType", {
	-- 			pattern = {
	-- 				"help",
	-- 				"alpha",
	-- 				"dashboard",
	-- 				"neo-tree",
	-- 				"Trouble",
	-- 				"lazy",
	-- 				"mason",
	-- 				"notify",
	-- 				"toggleterm",
	-- 				"lazyterm",
	-- 				"zsh"
	-- 			},
	-- 			callback = function()
	-- 				vim.b.miniindentscope_disable = true
	-- 			end,
	-- 		})
	-- 	end,
	-- },
	{
		"folke/noice.nvim",
		-- event = "VeryLazy",
		opts = {
			-- messages = {
			--   enabled = false -- view for warnings
			-- }
			-- add any options here
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		lazy = false
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

				-- Web
				"prettier",
				"html-lsp",
				"css-lsp",
				"typescript-language-server",
				"tailwindcss-language-server",
				"svelte-language-server",
				"astro-language-server",

				-- General
				"bash-language-server",

				-- DevOps
				"gopls",
				"ansible-language-server",
				"dockerfile-language-server",
				"docker-compose-language-service"
			}
		}
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local lspconfig = require("lspconfig")
			local on_attach = require("plugins.configs.lspconfig").on_attach
			-- local capabilities = require("plugins.configs.lspconfig").capabilities

			local servers = {
				-- Web
				"html",
				"cssls",
				"ts_ls",
				"tailwindcss",
				"svelte",
				"astro",

				-- General
				"bashls",
				"pylsp",
				"clangd",

				-- DevOps
				"ansiblels",
				"dockerls",
				"docker_compose_language_service",
				"gopls"
			}

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup {
					-- This NvChad thing fucks shit up
					on_attach = on_attach, -- This adds LSP code actions
					-- capabilities = capabilities,
				}
			end
		end,
		event = { "BufReadPre" } -- dont load on empty buffer
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			formatters_by_ft = {
				["yaml"] = { "" },
				["*"] = { "prettier" },
			},
			format_after_save = {
				lsp_fallback = true,
				async = true,
				timeout_ms = 1000,
			}
		},
	},
	{
		"mg979/vim-visual-multi",
		keys = { "<C-d>", "<M-C-Down>", "<M-C-Up>" }
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
				"javascript",
				"go",
				"dockerfile",
				"yaml",
				"bash",
				"astro",
				"svelte",
			},
		}
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {
			opts = {
				enable = true,
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = true,
				filetypes = {
					'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx',
					'jsx', 'rescript',
					'xml',
					'php',
					'markdown',
					'astro', 'glimmer', 'handlebars', 'hbs'
				}
			}
		},
		event = { "BufReadPre" } -- dont load on empty buffer
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
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
	},
}

return plugins

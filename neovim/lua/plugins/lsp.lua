return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"stevearc/conform.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- lua
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		-- rust
		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
			cmd = {
				"rustup",
				"run",
				"stable",
				"rust-analyzer",
			},
			settings = {
				["rust_analyzer"] = {},
			},
		})

		-- typescript
		lspconfig.tsserver.setup({
			capabilities = capabilities,
		})

		-- tailwind CSS
		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
		})

		-- golang
		lspconfig.gopls.setup({
			capabilities = capabilities,
			settings = {
				gopls = {
					-- for gopls to work when using build tags
					buildFlags = { "-tags=integration" },

					-- note: inlay hints will only be visible
					-- if vim.lsp.inlay_hint.is_enabled returns true
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
				},
			},
		})

		-- keymaps
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local opts = { buffer = event.buf }

				-- lsp basics
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
				vim.keymap.set({ "n", "v" }, "<leader>cm", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				-- signature
				vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

				-- diagnostics
				vim.keymap.set("n", "<leader>pd", vim.diagnostic.goto_prev)
				vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next)
				vim.keymap.set("n", "<leader>od", vim.diagnostic.open_float)

				-- toggle types (inlay hints)
				vim.keymap.set("n", "<leader>tt", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end)
			end,
		})

		-- autoformatting
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt" },
				go = { "goimports", "gofmt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}

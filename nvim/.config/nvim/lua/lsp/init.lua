require("lsp.gopls")
require("lsp.tailwindcss")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp.config", {}),
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		local opts = { buffer = ev.buf }
		local telescope = require("telescope.builtin")

		if client:supports_method("textDocument/definition") then
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		end

		if client:supports_method("textDocument/implementation") then
			vim.keymap.set("n", "gI", telescope.lsp_implementations, opts)
		end

		if client:supports_method("textDocument/typeDefinition") then
			vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts)
		end

		if client:supports_method("textDocument/rename") then
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		end

		if client:supports_method("textDocument/references") then
			vim.keymap.set("n", "<leader>gr", telescope.lsp_references, opts)
		end

		if client:supports_method("textDocument/codeAction") then
			vim.keymap.set("n", "<leader>cm", vim.lsp.buf.code_action, opts)
		end

		if client:supports_method("textDocument/signature") then
			vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
		end

		if client:supports_method("textDocument/inlayHint") then
			vim.keymap.set("n", "<leader>tt", function()
				vim.lsp.inlay_hint.enable(
					not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }),
					{ bufnr = ev.buf }
				)
			end, opts)
		end

		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
		end
		
		-- List of LSP that can be used to format buffers.
		-- Only whitelisted formatters referenced here will apply format on save through LSP.
		local formatters = {
			gopls = true,
		}
		if client:supports_method("textDocument/formatting") and formatters[client.name] then
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = group,
				buffer = ev.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
				end,
			})
		end
	end,
})

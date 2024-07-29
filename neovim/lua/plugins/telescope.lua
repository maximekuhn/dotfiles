return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
		vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>bs", builtin.lsp_document_symbols, {})
		vim.keymap.set("n", "<leader>gs", builtin.lsp_workspace_symbols, {})
		vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
	end,
}

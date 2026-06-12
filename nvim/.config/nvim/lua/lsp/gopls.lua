vim.lsp.config("gopls", {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork" },
	root_markers = { "go.work", "go.mod", ".git" },
	settings = {
		gopls = {
			hints= {
				assignVariableTypes = true,
			},
		},
	},
})

vim.lsp.enable("gopls")

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("TextYankPost", {
  group = augroup("HighlightYank", {}),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})

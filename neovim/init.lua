-- Install lazy nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Basic keymappings / setup
require("config.remap")
require("config.set")

-- Add templ filetypes
vim.filetype.add {
  extension = {
    templ = "templ"
  }
}

-- Setup lazy
require("lazy").setup({
    spec = "plugins",
    ui = {
        border = "rounded"
    }
})

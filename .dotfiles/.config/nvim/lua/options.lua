vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 8

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = true
vim.opt.guicursor = ""

vim.opt.clipboard:append("unnamedplus")

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.iskeyword:append("-")
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.updatetime = 50
vim.opt.autoread = true

vim.diagnostic.config({
    update_in_insert = false,
})
vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = false,
    signs = {
        text = {
            [vim.diagnostic.severity.HINT] = "󰛨",
            [vim.diagnostic.severity.INFO] = "󰌵",
            [vim.diagnostic.severity.WARN] = "󱧡",
            [vim.diagnostic.severity.ERROR] = "",
        },
        texthl = {
            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
        },
    },
})

vim.filetype.add({
    pattern = {
        [".*%.blade%.php"] = "blade",
    },
})

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        local mason_lspconfig = require("mason-lspconfig")
        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        local capabilities = vim.tbl_deep_extend(
            "force",
            {
                textDocument = {
                    foldingRange = {
                        dynamicRegistration = false,
                        lineFoldingOnly = true
                    }
                }
            },
            vim.lsp.protocol.make_client_capabilities(),
            cmp_nvim_lsp.default_capabilities()
        )

        vim.lsp.config("*", {
            single_file_support = true,
            capabilities = capabilities,
        })

        mason_lspconfig.setup({
            automatic_enable = true,
        })
    end,
}

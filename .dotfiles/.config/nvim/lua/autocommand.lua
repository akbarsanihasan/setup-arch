local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

autocmd("LspAttach", {
    group = augroup("user_lsp_attach", { clear = true }),
    callback = function(event)
        local keymap_opts = {
            noremap = true,
            silent = true,
            buffer = event.buf,
        }

        local format_opts = {
            timeout_ms = 2000,
            async = false,
            buffer = event.buf,
        }

        vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
        vim.keymap.set("n", "gf", vim.lsp.buf.references, keymap_opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, keymap_opts)
        vim.keymap.set("n", "]d", function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, keymap_opts)
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, keymap_opts)
        vim.keymap.set("n", "<leader>vdd", vim.diagnostic.open_float, keymap_opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, keymap_opts)
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, keymap_opts)
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, keymap_opts)

        vim.keymap.set("n", "<leader>vfc", function()
            vim.lsp.buf.format(format_opts)
        end, keymap_opts)

        autocmd("BufWritePre", {
            group = augroup("user_lsp_format", { clear = true }),
            callback = function()
                vim.lsp.buf.format(format_opts)
            end,
        })
    end,
})

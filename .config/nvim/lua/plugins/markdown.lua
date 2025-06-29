return {
    "epwalsh/obsidian.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "Notes",
                path = "~/Notes",
            },
        },
        daily_notes = {
            folder = "Journals",
            date_format = "%Y-%m-%d",
            alias_format = "%B %-d, %Y",
            default_tags = { "daily-notes" },
            template = nil
        },
        ---@param url string
        follow_url_func = function(url)
            vim.ui.open(url)
        end,
    },
    config = function(_, opts)
        local key_opts = { silent = true, noremap = true }
        vim.keymap.set("n", "<leader>osn", ":ObsidianQuickSwitch<cr>", key_opts)
        vim.keymap.set("n", "<leader>osh", ":ObsidianSearch<cr>", key_opts)
        vim.keymap.set("n", "<leader>onn", ":ObsidianNew<cr>", key_opts)
        vim.keymap.set({ "n", "v" }, "<leader>oxn", ":ObsidianExtractNote<cr>", key_opts)

        require("obsidian").setup(opts)
    end
}

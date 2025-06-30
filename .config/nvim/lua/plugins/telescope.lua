return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<C-p>",      ":Telescope find_files follow=true<cr>",             silent = true, noremap = true, },
        { "<leader>th", ":Telescope find_files follow=true hidden=true<cr>", silent = true, noremap = true, },
        { "<leader>tw", ":Telescope live_grep follow=true hidden=true<cr>",  silent = true, noremap = true, },
        { "<leader>tg", ":Telescope git_files follow=true hidden=true<cr>",  silent = true, noremap = true, },
    },
    opts = {
        defaults = {
            prompt_prefix = " 󰭎  ",
            selection_caret = " ",
            path_display = { "absolute" },
            sorting_strategy = "ascending",
            layout_config = {
                anchor = "N",
                prompt_position = "top",
            },
            mappings = {
                n = {
                    ["<C-t>"] = "nop",
                },
                i = {
                    ["<C-t>"] = "nop",
                },
            },
        },
    },
}

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<C-p>",      ":Telescope find_files follow=true hidden=true<cr>",  silent = true, noremap = true, },
        { "<leader>tw", ":Telescope grep_string follow=true hidden=true<cr>", silent = true, noremap = true, },
        { "<leader>tg", ":Telescope git_files follow=true hidden=true<cr>",   silent = true, noremap = true, },
    },
    opts = {
        defaults = {
            prompt_prefix = " 󰭎  ",
            selection_caret = " ",
            path_display = {
                filename_first = {}
            },
            sorting_strategy = "ascending",
            layout_strategy = "vertical",
            layout_config = {
                width = 0.50,
                height = 0.9,
                anchor = "N",
                anchor_padding = 2,
                prompt_position = "top",
                preview_cutoff = 20,
                mirror = true
            },
            file_ignore_patterns = {
                "^.git/",
                "^node_modules/",
                "^vendor/"
            },
        },
    },
}

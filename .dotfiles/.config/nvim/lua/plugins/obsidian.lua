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
        templates = {
            folder = ".templates",
            date_format = "%Y-%m-%d-%a",
            time_format = "%H:%M",
            substitutions = {
                date_human = function()
                    return os.date("%A, %d %B %Y")
                end
            }
        },
        daily_notes = {
            folder = "Journals",
            date_format = "%Y-%m-%d",
            alias_format = "%B %-d, %Y",
            default_tags = { "Journal" },
            template = "journal.md"
        },
        mappings = {
            ["gf"] = {
                action = function()
                    return require("obsidian").util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
            ["<leader>ch"] = {
                action = function()
                    return require("obsidian").util.toggle_checkbox()
                end,
                opts = { buffer = true },
            },
        },
        ---@param url string
        follow_url_func = function(url)
            vim.ui.open(url)
        end,
    },
    config = function(_, opts)
        local key_opts = { silent = true, noremap = true }
        vim.keymap.set("n", "<leader>oss", ":ObsidianSearch<cr>", key_opts)
        vim.keymap.set("n", "<leader>osq", ":ObsidianQuickSwitch<cr>", key_opts)
        vim.keymap.set("n", "<leader>ost", ":ObsidianTags<cr>", key_opts)
        vim.keymap.set("n", "<leader>osl", ":ObsidianLinks<cr>", key_opts)
        vim.keymap.set("n", "<leader>osb", ":ObsidianBacklinks<cr>", key_opts)
        vim.keymap.set("n", "<leader>osd", ":ObsidianDailies<cr>", key_opts)
        vim.keymap.set("n", "<leader>onn", ":ObsidianNew<cr>", key_opts)
        vim.keymap.set("n", "<leader>oit", ":ObsidianTemplate<cr>", key_opts)
        vim.keymap.set("n", "<leader>oow", ":ObsidianOpen<cr>", key_opts)
        vim.keymap.set({ "v" }, "<leader>onl", ":ObsidianLinkNew<cr>", key_opts)
        vim.keymap.set({ "n", "v" }, "<leader>onx", ":ObsidianExtractNote<cr>", key_opts)

        require("obsidian").setup(opts)
    end
}

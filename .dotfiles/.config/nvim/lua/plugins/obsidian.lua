return {
    "epwalsh/obsidian.nvim",
    version = "*",
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { mode = "n",          "<leader>oss", ":ObsidianSearch<cr>",      silent = true, noremap = true },
        { mode = "n",          "<leader>osq", ":ObsidianQuickSwitch<cr>", silent = true, noremap = true },
        { mode = "n",          "<leader>ost", ":ObsidianTags<cr>",        silent = true, noremap = true },
        { mode = "n",          "<leader>osl", ":ObsidianLinks<cr>",       silent = true, noremap = true },
        { mode = "n",          "<leader>osb", ":ObsidianBacklinks<cr>",   silent = true, noremap = true },
        { mode = "n",          "<leader>osd", ":ObsidianDailies<cr>",     silent = true, noremap = true },
        { mode = "n",          "<leader>onn", ":ObsidianNew<cr>",         silent = true, noremap = true },
        { mode = "n",          "<leader>oit", ":ObsidianTemplate<cr>",    silent = true, noremap = true },
        { mode = "n",          "<leader>oow", ":ObsidianOpen<cr>",        silent = true, noremap = true },
        { mode = { "v" },      "<leader>onl", ":ObsidianLinkNew<cr>",     silent = true, noremap = true },
        { mode = { "n", "v" }, "<leader>onx", ":ObsidianExtractNote<cr>", silent = true, noremap = true },
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
        ---t
        follow_url_func = function(url)
            vim.ui.open(url)
        end,
    },
}

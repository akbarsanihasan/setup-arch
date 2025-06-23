return {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    dependencies = {
        "nvim-orgmode/org-bullets.nvim",
        "nvim-orgmode/telescope-orgmode.nvim",
    },
    config = function()
        local orgmode = require("orgmode")
        local orgbullets = require("org-bullets")
        local telescope = require("telescope")

        orgbullets.setup({
            concealcursor = true,
            symbol = {
                list = "•",
            }
        })
        orgmode.setup({
            org_agenda_files = '~/Personal/Notes/**/*',
            org_default_notes_file = '~/Personal/Refile.org',
            org_cycle_separator_lines = 2,
            org_capture_templates = {
                t = {
                    description = 'Todo',
                    template = '* TODO %?',
                },
                j = {
                    description = 'Journal',
                    template = '* %<%Y-%m-%d> %<%A>\n %?',
                    target = '~/Personal/Journal/%<%Y-%m>.org'
                },
            }
        })

        telescope.load_extension("orgmode")
        vim.keymap.set("n", "<leader>orh", telescope.extensions.orgmode.refile_heading)
        vim.keymap.set("n", "<leader>osh", telescope.extensions.orgmode.search_headings)
        vim.keymap.set("n", "<leader>oil", telescope.extensions.orgmode.insert_link)
    end
}

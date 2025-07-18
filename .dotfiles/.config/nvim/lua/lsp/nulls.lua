return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
        "mason-org/mason.nvim",
        "jay-babu/mason-null-ls.nvim",
    },
    config = function()
        local nulls = require("null-ls")
        local mason_nulls = require("mason-null-ls")

        nulls.setup()
        mason_nulls.setup({ handlers = { }, })
    end
}

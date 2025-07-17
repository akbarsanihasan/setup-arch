return {
	"mason-org/mason.nvim",
	lazy = false,
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer",
	},
	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)
		require("mason-tool-installer").setup({
			auto_update = true,
			run_on_start = true,
			start_delay = 3000,
			integrations = {
				["mason-lspconfig"] = true,
				["mason-null-ls"] = true,
			},
			ensure_installed = {
				-- LSP server
				"gopls",
				"phpactor",
				"ts_ls",
				"clangd",
				"rust_analyzer",
				"lua_ls",
				"bash-language-server",
				"html",
				"cssls",

				-- Formatter
				"php-cs-fixer",
				"prettierd",
				"clang-format",
				"shfmt",
				"shellharden",

				-- Misc
				"emmet-language-server",
			},
		})
	end,
}

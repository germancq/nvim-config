return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")

		local mason_tool_installer = require("mason-tool-installer")
		local mason_lspconfig = require("mason-lspconfig")
		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettierd", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint", -- python linter
			},
		})
		mason_lspconfig.setup({
			ensure_installed = {
				"pyright",
				"lua_ls",
				"marksman",
				"pylsp",
				"texlab",
				"arduino_language_server",
				"ansiblels",
				"docker_compose_language_service",
				"jsonls",
				"yamlls",
			},
		})
	end,
}

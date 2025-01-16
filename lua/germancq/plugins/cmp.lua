return {
	-- Plugin para autocompletado
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- Integración con LSP
			"hrsh7th/cmp-buffer", -- Autocompletado basado en el buffer
			"hrsh7th/cmp-path", -- Autocompletado basado en el sistema de archivos
			"saadparwaiz1/cmp_luasnip", -- Integración de nvim-cmp con LuaSnip
			"L3MON4D3/LuaSnip", -- LuaSnip para snippets
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			-- Configuración de nvim-cmp
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- Expande los snippets con LuaSnip
					end,
				},
				mapping = {
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-e>"] = cmp.mapping.abort(),
				},
				sources = {
					{ name = "nvim_lsp" }, -- Autocompletado LSP
					{ name = "buffer" }, -- Autocompletado basado en el buffer
					{ name = "path" }, -- Autocompletado basado en el sistema de archivos
					{ name = "luasnip" }, -- Autocompletado de snippets
				},
			})

			-- Cargar snippets predeterminados de VSCode
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}

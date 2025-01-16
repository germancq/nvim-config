return {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" },
	require("luasnip.loaders.from_vscode").lazy_load(),
	--config = function()
	-- ~/.config/nvim/lua/plugins/lsp.lua o el archivo de configuración correspondiente
	--	local luasnip = require("luasnip")
	--	local snippets_dir = vim.fn.stdpath("config") .. "/lua/germancq/plugins/"

	-- Cargar los snippets
	--	require("luasnip.loaders.from_lua").load({ paths = snippets_dir .. "snippets/" })

	-- Puedes agregar más lenguajes según tus necesidades
	--end,
}

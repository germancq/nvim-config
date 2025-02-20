return {
	"alpertuna/vim-header",
	config = function()
		-- Configuración para personalizar el header
		vim.g.header_field_author = "German C.Quiveu"
		vim.g.header_field_author_email = "germancq@dte.us.es"
		vim.g.header_auto_add_header = 1
		vim.g.header_auto_update_header = 1
	end,
}

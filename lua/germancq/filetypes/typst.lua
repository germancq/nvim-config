-- Configuración Typst
vim.api.nvim_create_autocmd("FileType", {
	pattern = "typst",
	callback = function()
		-- Hard wrap para navegación cómoda
		vim.opt_local.textwidth = 80
		vim.opt_local.formatoptions:append("t")

		-- Soft wrap para lectura
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true

		-- Guía visual de 80 cols
		vim.opt_local.colorcolumn = "80"
	end,
})

-- Autoformateo al guardar
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.typ",
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})

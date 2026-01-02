-- ~/.config/nvim/ftplugin/tex.lua
-- Auto-wrap LaTeX simple, preservando \\ en tablas y líneas de comentarios

local api = vim.api

vim.opt_local.textwidth = 80
vim.opt_local.formatoptions:append("t")
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.expandtab = true

-- Wrap físico
local function wrap_line(line, width)
	local res = {}
	local pos = 1
	while pos <= #line do
		if #line - pos + 1 <= width then
			table.insert(res, line:sub(pos))
			break
		end
		local wrap_pos = pos + width - 1
		local space_pos = line:sub(pos, wrap_pos):match("^.*()%s")
		if space_pos then
			table.insert(res, line:sub(pos, pos + space_pos - 1))
			pos = pos + space_pos
			while line:sub(pos, pos):match("%s") do
				pos = pos + 1
			end
		else
			table.insert(res, line:sub(pos, wrap_pos))
			pos = wrap_pos + 1
		end
	end
	return res
end

-- Separar línea en comandos LaTeX sin separar \\
local function split_latex_line(line)
	local parts = {}
	local buf = ""
	local in_braces = 0
	local i = 1
	while i <= #line do
		local c = line:sub(i, i)
		local next_two = line:sub(i, i + 1)

		if c == "{" then
			in_braces = in_braces + 1
			buf = buf .. c
			i = i + 1
		elseif c == "}" then
			in_braces = math.max(in_braces - 1, 0)
			buf = buf .. c
			i = i + 1
		elseif next_two == "\\\\" then
			-- mantener \\ como parte de la línea
			buf = buf .. "\\\\"
			i = i + 2
		elseif c == "\\" and in_braces == 0 then
			-- Comando LaTeX que empieza con \ seguido de letras
			local s, e = line:find("\\%a+", i)
			if s then
				if buf ~= "" then
					table.insert(parts, buf)
				end
				buf = line:sub(s, e)
				i = e + 1
			else
				buf = buf .. c
				i = i + 1
			end
		else
			buf = buf .. c
			i = i + 1
		end
	end
	if buf ~= "" then
		table.insert(parts, buf)
	end
	return parts
end

-- Función principal
local function rewrap_latex()
	local lines = api.nvim_buf_get_lines(0, 0, -1, false)
	local new_lines = {}

	for _, line in ipairs(lines) do
		if line:match("^%s*%%") or line:match("^%s*$") then
			table.insert(new_lines, line)
		else
			local parts = split_latex_line(line)
			for _, part in ipairs(parts) do
				part = vim.trim(part)
				if part ~= "" then
					if part:sub(1, 1) == "\\" and part ~= "\\\\" then
						-- comando LaTeX → línea propia
						table.insert(new_lines, part)
					else
						-- texto normal o \\ → wrap
						local wrapped = wrap_line(part, vim.opt_local.textwidth:get())
						for _, wline in ipairs(wrapped) do
							table.insert(new_lines, wline)
						end
					end
				end
			end
		end
	end

	api.nvim_buf_set_lines(0, 0, -1, false, new_lines)
end

api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.tex",
	callback = rewrap_latex,
})

-- ~/.config/nvim/lua/germancq/filetypes/tex.lua
-- Auto-wrap LaTeX seguro, mantiene comandos inline y comentarios
-- No borra contenido, wrap manual con :WrapLatex o <leader>lw

local api = vim.api

-- Configuración local del buffer
vim.opt_local.textwidth = 80
vim.opt_local.formatoptions:append("t")
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.expandtab = true

-- Comandos LaTeX que se consideran inline (no van a línea propia)
local inline_cmds = {
	cite = true,
	ref = true,
	eqref = true,
	textit = true,
	textbf = true,
	emph = true,
	label = true,
	url = true,
	footnote = true,
	gls = true,
	Gls = true,
}

local function is_inline_command(cmd)
	local name = cmd:match("^\\(%a+)")
	return name and inline_cmds[name]
end

-- Función de wrap seguro de una línea
local function wrap_line(line, width)
	local res = {}
	if line == "" then
		return { "" }
	end
	local pos = 1
	while pos <= #line do
		if #line - pos + 1 <= width then
			table.insert(res, line:sub(pos))
			break
		end
		local wrap_pos = pos + width - 1
		if wrap_pos > #line then
			wrap_pos = #line
		end
		local segment = line:sub(pos, wrap_pos)
		local space_pos = segment:match("^.*()%s")
		if space_pos and space_pos > 0 then
			table.insert(res, line:sub(pos, pos + space_pos - 1))
			pos = pos + space_pos
			while line:sub(pos, pos):match("%s") do
				pos = pos + 1
			end
		else
			table.insert(res, segment)
			pos = pos + 1
		end
	end
	if #res == 0 then
		table.insert(res, line)
	end
	return res
end

-- Separar línea en comandos LaTeX, preservando inline y \\
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
			buf = buf .. "\\\\"
			i = i + 2
		elseif c == "\\" and in_braces == 0 then
			local s, e = line:find("\\%a+", i)
			if s then
				local cmd = line:sub(s, e)
				if is_inline_command(cmd) then
					buf = buf .. cmd
				else
					if buf ~= "" then
						table.insert(parts, buf)
					end
					buf = cmd
				end
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
	if #parts == 0 then
		table.insert(parts, line)
	end
	return parts
end

-- Función principal de wrap seguro
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
				if part == "" then
					part = line
				end
				if part:sub(1, 1) == "\\" and not is_inline_command(part) and part ~= "\\\\" then
					table.insert(new_lines, part)
				else
					local wrapped = wrap_line(part, vim.opt_local.textwidth:get())
					for _, w in ipairs(wrapped) do
						table.insert(new_lines, w)
					end
				end
			end
		end
	end
	if #new_lines == 0 then
		new_lines = lines
	end
	api.nvim_buf_set_lines(0, 0, -1, false, new_lines)
end

-- Comando manual para aplicar wrap
vim.api.nvim_create_user_command("WrapLatex", rewrap_latex, {})

-- Mapeo rápido <leader>lw para wrap
vim.api.nvim_buf_set_keymap(0, "n", "<leader>lw", ":WrapLatex<CR>", { noremap = true, silent = true })

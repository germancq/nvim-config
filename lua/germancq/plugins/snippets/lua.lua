local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

ls.add_snippets("lua", {
	-- Function definition
	s("func", {
		t("function "),
		i(1, "function_name"),
		t("("),
		i(2, "args"),
		t(")\n    "),
		i(3, "-- body"),
		t("\nend\n"),
	}),

	-- Local function
	s("locfunc", {
		t("local function "),
		i(1, "function_name"),
		t("("),
		i(2, "args"),
		t(")\n    "),
		i(3, "-- body"),
		t("\nend\n"),
	}),

	-- If statement
	s("if", {
		t("if "),
		i(1, "condition"),
		t(" then\n    "),
		i(2, "-- body"),
		t("\nend\n"),
	}),

	-- If-Else statement
	s("ifelse", {
		t("if "),
		i(1, "condition"),
		t(" then\n    "),
		i(2, "-- body"),
		t("\nelse\n    "),
		i(3, "-- else body"),
		t("\nend\n"),
	}),

	-- For loop (numerical)
	s("for", {
		t("for "),
		i(1, "i = 1, "),
		i(2, "n"),
		t(" do\n    "),
		i(3, "-- body"),
		t("\nend\n"),
	}),

	-- For loop (pairs/ipairs)
	s("forin", {
		t("for "),
		i(1, "key, value"),
		t(" in "),
		c(2, { t("pairs"), t("ipairs") }),
		t("("),
		i(3, "table"),
		t(") do\n    "),
		i(4, "-- body"),
		t("\nend\n"),
	}),

	-- While loop
	s("while", {
		t("while "),
		i(1, "condition"),
		t(" do\n    "),
		i(2, "-- body"),
		t("\nend\n"),
	}),

	-- Local variable
	s("local", {
		t("local "),
		i(1, "variable"),
		t(" = "),
		i(2, "value"),
	}),

	-- Require a module
	s("require", {
		t("local "),
		i(1, "module"),
		t(" = require('"),
		i(2, "module_name"),
		t("')"),
	}),

	-- Table definition
	s("table", {
		t("local "),
		i(1, "table_name"),
		t(" = {\n    "),
		i(2, "-- key-value pairs"),
		t("\n}"),
	}),

	-- Metatable setup
	s("metatable", {
		t("local "),
		i(1, "obj"),
		t(" = {}\n"),
		t("setmetatable("),
		i(1),
		t(", {\n    "),
		t("__index = "),
		i(2, "function(t, k)"),
		t(" return "),
		i(3, "nil"),
		t(" end,\n"),
		t("__newindex = "),
		i(4, "function(t, k, v)"),
		t(" rawset(t, k, v) end,\n"),
		t("})\n"),
	}),

	-- Print statement
	s("print", {
		t("print("),
		i(1, '"message"'),
		t(")"),
	}),

	-- Module template
	s("module", {
		t("local "),
		i(1, "M"),
		t(" = {}\n\n"),
		t("function "),
		i(1),
		t(":"),
		i(2, "function_name"),
		t("("),
		i(3, "args"),
		t(")\n    "),
		i(4, "-- body"),
		t("\nend\n\n"),
		t("return "),
		i(1),
		t("\n"),
	}),

	-- Main block
	s("main", {
		t('if ... == "__main__" then\n    '),
		i(1, "-- body"),
		t("\nend\n"),
	}),

	-- Comment block
	s("comment", {
		t("--[[ "),
		i(1, "Comment"),
		t(" ]]"),
	}),

	-- Error handling with pcall
	s("pcall", {
		t("local success, result = pcall("),
		i(1, "function"),
		t(")\n"),
		t("if not success then\n    "),
		t("print('Error: ', result)\nend\n"),
	}),

	-- String interpolation
	s("string", {
		t('string.format("'),
		i(1, "template"),
		t('", '),
		i(2, "values"),
		t(")"),
	}),

	-- Coroutines
	s("coroutine", {
		t("local "),
		i(1, "co"),
		t(" = coroutine.create(function()\n    "),
		i(2, "-- body"),
		t("\nend)\n"),
		t("coroutine.resume("),
		i(1),
		t(")"),
	}),
})

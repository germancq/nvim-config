local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

ls.add_snippets("go", {
	-- Function definition
	s("func", {
		t("func "),
		i(1, "functionName"),
		t("("),
		i(2, "args"),
		t(") "),
		i(3, "returnType"),
		t(" {\n    "),
		i(4, "// body"),
		t("\n}\n"),
	}),

	-- Main function
	s("main", {
		t("func main() {\n    "),
		i(1, "// body"),
		t("\n}\n"),
	}),

	-- If statement
	s("if", {
		t("if "),
		i(1, "condition"),
		t(" {\n    "),
		i(2, "// body"),
		t("\n}\n"),
	}),

	-- If-Else statement
	s("ifelse", {
		t("if "),
		i(1, "condition"),
		t(" {\n    "),
		i(2, "// body"),
		t("\n} else {\n    "),
		i(3, "// else body"),
		t("\n}\n"),
	}),

	-- For loop
	s("for", {
		t("for "),
		i(1, "i := 0; i < "),
		i(2, "n"),
		t("; i++ {\n    "),
		i(3, "// body"),
		t("\n}\n"),
	}),

	-- For-Range loop
	s("forrange", {
		t("for "),
		i(1, "key, value"),
		t(" := range "),
		i(2, "iterable"),
		t(" {\n    "),
		i(3, "// body"),
		t("\n}\n"),
	}),

	-- Struct definition
	s("struct", {
		t("type "),
		i(1, "StructName"),
		t(" struct {\n    "),
		i(2, "FieldName FieldType"),
		t("\n}\n"),
	}),

	-- Method definition
	s("method", {
		t("func ("),
		i(1, "receiver"),
		t(" "),
		i(2, "Type"),
		t(") "),
		i(3, "MethodName"),
		t("("),
		i(4, "args"),
		t(") "),
		i(5, "returnType"),
		t(" {\n    "),
		i(6, "// body"),
		t("\n}\n"),
	}),

	-- Interface definition
	s("interface", {
		t("type "),
		i(1, "InterfaceName"),
		t(" interface {\n    "),
		i(2, "MethodName(args) returnType"),
		t("\n}\n"),
	}),

	-- Goroutine
	s("goroutine", {
		t("go func() {\n    "),
		i(1, "// body"),
		t("\n}()\n"),
	}),

	-- Error handling
	s("errcheck", {
		t("if err != nil {\n    "),
		i(1, "return"),
		t("\n}\n"),
	}),

	-- Print statement
	s("print", {
		t('fmt.Println("'),
		i(1, "message"),
		t('")'),
	}),

	-- Import statement
	s("import", {
		t('import (\n    "'),
		i(1, "package"),
		t('"\n)'),
	}),

	-- JSON Marshalling
	s("jsonmarshal", {
		t("jsonData, err := json.Marshal("),
		i(1, "data"),
		t(")\nif err != nil {\n    "),
		t("return err\n}\n"),
	}),

	-- JSON Unmarshalling
	s("jsonunmarshal", {
		t("err := json.Unmarshal("),
		i(1, "jsonData"),
		t(", &"),
		i(2, "structVar"),
		t(")\nif err != nil {\n    "),
		t("return err\n}\n"),
	}),

	-- HTTP handler
	s("httphandler", {
		t('http.HandleFunc("/'),
		i(1, "path"),
		t('", func(w http.ResponseWriter, r *http.Request) {\n    '),
		i(2, "// body"),
		t("\n})"),
	}),

	-- Defer statement
	s("defer", {
		t("defer "),
		i(1, "functionCall"),
		t("\n"),
	}),

	-- Switch statement
	s("switch", {
		t("switch "),
		i(1, "variable"),
		t(" {\ncase "),
		i(2, "value1"),
		t(":\n    "),
		i(3, "// body"),
		t("\ncase "),
		i(4, "value2"),
		t(":\n    "),
		i(5, "// body"),
		t("\ndefault:\n    "),
		i(6, "// default body"),
		t("\n}\n"),
	}),

	-- Select statement
	s("select", {
		t("select {\ncase "),
		i(1, "chan1"),
		t(" := <-"),
		i(2, "channel1"),
		t(":\n    "),
		i(3, "// body"),
		t("\ncase "),
		i(4, "chan2"),
		t(" := <-"),
		i(5, "channel2"),
		t(":\n    "),
		i(6, "// body"),
		t("\ndefault:\n    "),
		i(7, "// default body"),
		t("\n}\n"),
	}),
})

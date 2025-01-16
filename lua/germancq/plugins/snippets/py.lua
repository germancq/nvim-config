local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

ls.add_snippets("python", {
	-- Function definition
	s("def", {
		t("def "),
		i(1, "function_name"),
		t("("),
		i(2, "args"),
		t("):\n    "),
		i(3, "pass"),
		t("\n"),
	}),

	-- If statement
	s("if", {
		t("if "),
		i(1, "condition"),
		t(":\n    "),
		i(2, "pass"),
		t("\n"),
	}),

	-- Elif-Else statement
	s("ifelse", {
		t("if "),
		i(1, "condition"),
		t(":\n    "),
		i(2, "pass"),
		t("\nelif "),
		i(3, "another_condition"),
		t(":\n    "),
		i(4, "pass"),
		t("\nelse:\n    "),
		i(5, "pass"),
		t("\n"),
	}),

	-- For loop
	s("for", {
		t("for "),
		i(1, "item"),
		t(" in "),
		i(2, "iterable"),
		t(":\n    "),
		i(3, "pass"),
		t("\n"),
	}),

	-- While loop
	s("while", {
		t("while "),
		i(1, "condition"),
		t(":\n    "),
		i(2, "pass"),
		t("\n"),
	}),

	-- Class definition
	s("class", {
		t("class "),
		i(1, "ClassName"),
		t(":\n    def __init__(self, "),
		i(2, "args"),
		t("):\n        "),
		t("super().__init__()\n        "),
		i(3, "self.attribute = value"),
		t("\n"),
	}),

	-- Try-Except block
	s("try", {
		t("try:\n    "),
		i(1, "pass"),
		t("\nexcept "),
		i(2, "Exception"),
		t(" as e:\n    "),
		i(3, "pass"),
		t("\n"),
	}),

	-- Try-Except-Finally block
	s("tryfinally", {
		t("try:\n    "),
		i(1, "pass"),
		t("\nexcept "),
		i(2, "Exception"),
		t(" as e:\n    "),
		i(3, "pass"),
		t("\nfinally:\n    "),
		i(4, "pass"),
		t("\n"),
	}),

	-- With statement
	s("with", {
		t("with "),
		i(1, "open('file.txt', 'r')"),
		t(" as "),
		i(2, "file"),
		t(":\n    "),
		i(3, "pass"),
		t("\n"),
	}),

	-- List comprehension
	s("listcomp", {
		t("["),
		i(1, "x"),
		t(" for "),
		i(2, "x"),
		t(" in "),
		i(3, "iterable"),
		t(" if "),
		i(4, "condition"),
		t("]"),
	}),

	-- Lambda function
	s("lambda", {
		t("lambda "),
		i(1, "args"),
		t(": "),
		i(2, "expression"),
	}),

	-- Decorator
	s("decorator", {
		t("@"),
		i(1, "decorator_name"),
		t("\ndef "),
		i(2, "function_name"),
		t("("),
		i(3, "args"),
		t("):\n    "),
		i(4, "pass"),
		t("\n"),
	}),

	-- Main block
	s("main", {
		t('if __name__ == "__main__":\n    '),
		i(1, "main()"),
		t("\n"),
	}),

	-- Print statement
	s("print", {
		t("print("),
		i(1, '"message"'),
		t(")"),
	}),

	-- Docstring
	s("docstring", {
		t('"""'),
		i(1, "Description"),
		t('"""\n'),
	}),

	-- Import statement
	s("import", {
		t("import "),
		i(1, "module"),
	}),

	-- From Import statement
	s("fromimport", {
		t("from "),
		i(1, "module"),
		t(" import "),
		i(2, "function"),
	}),

	-- Raise Exception
	s("raise", {
		t("raise "),
		i(1, "Exception"),
		t("("),
		i(2, '"Error message"'),
		t(")"),
	}),

	-- Assert statement
	s("assert", {
		t("assert "),
		i(1, "condition"),
		t(", "),
		i(2, '"Error message"'),
	}),

	-- Dictionary comprehension
	s("dictcomp", {
		t("{"),
		i(1, "key"),
		t(": "),
		i(2, "value"),
		t(" for "),
		i(3, "key, value"),
		t(" in "),
		i(4, "iterable"),
		t(" if "),
		i(5, "condition"),
		t("}"),
	}),

	-- F-String
	s("fstring", {
		t('f"'),
		i(1, "text"),
		t("{"),
		i(2, "variable"),
		t("}"),
		t('"'),
	}),

	-- Property
	s("property", {
		t("@property\n"),
		t("def "),
		i(1, "attribute"),
		t("(self):\n    return self._"),
		i(1),
		t("\n\n"),
		t("@"),
		i(1),
		t(".setter\n"),
		t("def "),
		i(1),
		t("(self, value):\n    self._"),
		i(1),
		t(" = value\n"),
	}),
})

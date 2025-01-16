local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("c", {
	-- Main function
	s("main", {
		t("#include <stdio.h>\n\nint main() {\n    "),
		i(1, "// body"),
		t("\n    return 0;\n}\n"),
	}),

	-- Printf statement
	s("printf", {
		t('printf("'),
		i(1, "message"),
		t('\\n");'),
	}),

	-- Function definition
	s("func", {
		i(1, "returnType"),
		t(" "),
		i(2, "functionName"),
		t("("),
		i(3, "args"),
		t(") {\n    "),
		i(4, "// body"),
		t("\n}\n"),
	}),

	-- For loop
	s("for", {
		t("for (int "),
		i(1, "i"),
		t(" = 0; "),
		i(1),
		t(" < "),
		i(2, "n"),
		t("; "),
		i(1),
		t("++) {\n    "),
		i(3, "// body"),
		t("\n}\n"),
	}),

	-- While loop
	s("while", {
		t("while ("),
		i(1, "condition"),
		t(") {\n    "),
		i(2, "// body"),
		t("\n}\n"),
	}),

	-- If statement
	s("if", {
		t("if ("),
		i(1, "condition"),
		t(") {\n    "),
		i(2, "// body"),
		t("\n}\n"),
	}),

	-- If-Else statement
	s("ifelse", {
		t("if ("),
		i(1, "condition"),
		t(") {\n    "),
		i(2, "// body"),
		t("\n} else {\n    "),
		i(3, "// else body"),
		t("\n}\n"),
	}),

	-- Switch statement
	s("switch", {
		t("switch ("),
		i(1, "variable"),
		t(") {\ncase "),
		i(2, "value1"),
		t(":\n    "),
		i(3, "// body"),
		t("\n    break;\ncase "),
		i(4, "value2"),
		t(":\n    "),
		i(5, "// body"),
		t("\n    break;\ndefault:\n    "),
		i(6, "// default body"),
		t("\n}\n"),
	}),

	-- Struct definition
	s("struct", {
		t("typedef struct {\n    "),
		i(1, "int field;"),
		t("\n} "),
		i(2, "StructName"),
		t(";\n"),
	}),

	-- Include header
	s("include", {
		t("#include <"),
		i(1, "header"),
		t(">\n"),
	}),

	-- Macro definition
	s("macro", {
		t("#define "),
		i(1, "MACRO_NAME"),
		t(" "),
		i(2, "value"),
	}),

	-- Memory allocation
	s("malloc", {
		t("int *"),
		i(1, "ptr"),
		t(" = (int *)malloc("),
		i(2, "size"),
		t(" * sizeof(int));\nif (!"),
		i(1),
		t(") {\n    "),
		t('perror("malloc failed");\n    exit(EXIT_FAILURE);\n}\n'),
	}),

	-- Free memory
	s("free", {
		t("free("),
		i(1, "ptr"),
		t(");"),
	}),

	-- Comment block
	s("comment", {
		t("/* "),
		i(1, "Comment"),
		t(" */"),
	}),

	-- Error handling
	s("errcheck", {
		t("if ("),
		i(1, "errorCondition"),
		t(") {\n    "),
		t('fprintf(stderr, "'),
		i(2, "Error message"),
		t('\\n");\n    '),
		t("exit(EXIT_FAILURE);\n}\n"),
	}),

	-- File handling (fopen, fclose)
	s("file", {
		t("FILE *"),
		i(1, "file"),
		t(' = fopen("'),
		i(2, "filename"),
		t('", "'),
		i(3, "mode"),
		t('");\nif (!'),
		i(1),
		t(") {\n    "),
		t('perror("fopen failed");\n    exit(EXIT_FAILURE);\n}\n'),
		i(4, "// body"),
		t("\nfclose("),
		i(1),
		t(");\n"),
	}),

	-- Inline comment
	s("cmt", {
		t("// "),
		i(1, "Comment"),
	}),

	-- Exit statement
	s("exit", {
		t("exit("),
		i(1, "EXIT_SUCCESS"),
		t(");"),
	}),

	-- Return statement
	s("ret", {
		t("return "),
		i(1, "value"),
		t(";"),
	}),
})

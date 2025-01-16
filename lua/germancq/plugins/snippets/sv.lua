local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node

ls.add_snippets("systemverilog", {
	-- Module
	s("module", {
		t("module "),
		i(1, "module_name"),
		t(" ("),
		i(2, "// ports"),
		t(");\n"),
		t("  // Body\n"),
		t("endmodule\n"),
	}),

	-- Always_ff block
	s("always_ff", {
		t("always_ff @(posedge "),
		i(1, "clk"),
		t(" or negedge "),
		i(2, "rst"),
		t(") begin\n  "),
		i(3, "// body"),
		t("\nend\n"),
	}),

	-- Always_comb block
	s("always_comb", {
		t("always_comb begin\n  "),
		i(1, "// body"),
		t("\nend\n"),
	}),

	-- Parameterized Module
	s("param_module", {
		t("module "),
		i(1, "module_name"),
		t(" #(\n  parameter "),
		i(2, "WIDTH = 8"),
		t("\n) (\n  "),
		i(3, "// ports"),
		t("\n);\n\n"),
		t("  // Body\n\n"),
		t("endmodule\n"),
	}),

	-- Interface
	s("interface", {
		t("interface "),
		i(1, "interface_name"),
		t(" ();\n"),
		t("  // Body\n"),
		t("endinterface\n"),
	}),

	-- Initial block
	s("initial", {
		t("initial begin\n  "),
		i(1, "// body"),
		t("\nend\n"),
	}),

	-- Testbench Template
	s("tb", {
		t("// Testbench for "),
		i(1, "module_name"),
		t("\n"),
		t("module "),
		i(2, "module_name"),
		t("_tb;\n\n"),
		t("  // DUT instance\n  "),
		i(3, "module_name"),
		t(" uut (\n    .clk(clk),\n    .rst(rst)\n  );\n\n"),
		t('  initial begin\n    $dumpfile("'),
		i(4, "waveform.vcd"),
		t('");\n    $dumpvars(0, '),
		i(2),
		t("_tb);\n\n"),
		t("    "),
		i(5, "// test stimulus"),
		t("\n\n"),
		t("    $finish;\n  end\n\n"),
		t("endmodule\n"),
	}),

	-- FIFO Template
	s("fifo", {
		t(
			"module fifo #(\n  parameter DEPTH = 16,\n  parameter WIDTH = 8\n) (\n  input logic clk,\n  input logic rst,\n"
		),
		t(
			"  input logic wr_en,\n  input logic rd_en,\n  input logic [WIDTH-1:0] wr_data,\n  output logic [WIDTH-1:0] rd_data,\n"
		),
		t("  output logic full,\n  output logic empty\n);\n\n"),
		t("  // FIFO Body\n\n"),
		t("endmodule\n"),
	}),

	-- Case Statement
	s("case", {
		t("case ("),
		i(1, "expression"),
		t(")\n"),
		t("  "),
		i(2, "value1"),
		t(": "),
		i(3, "// action1"),
		t(";\n"),
		t("  "),
		i(4, "value2"),
		t(": "),
		i(5, "// action2"),
		t(";\n"),
		t("  default: "),
		i(6, "// default action"),
		t(";\n"),
		t("endcase\n"),
	}),

	-- For Loop
	s("for", {
		t("for (int "),
		i(1, "i = 0"),
		t("; "),
		i(2, "i < limit"),
		t("; "),
		i(3, "i++"),
		t(") begin\n  "),
		i(4, "// body"),
		t("\nend\n"),
	}),

	-- Generate Block
	s("generate", {
		t("generate\n  "),
		i(1, "// body"),
		t("\nendgenerate\n"),
	}),

	-- Clock Divider
	s("clk_div", {
		t("module clk_div (\n  input logic clk,\n  input logic rst,\n  output logic clk_out\n);\n\n"),
		t("  logic [31:0] count;\n\n"),
		t("  always_ff @(posedge clk or negedge rst) begin\n"),
		t("    if (!rst)\n      count <= 0;\n    else\n      count <= count + 1;\n  end\n\n"),
		t("  assign clk_out = count[0];\n\n"),
		t("endmodule\n"),
	}),

	-- Function
	s("function", {
		t("function "),
		i(1, "return_type"),
		t(" "),
		i(2, "function_name"),
		t("("),
		i(3, "// inputs"),
		t(");\n"),
		t("  "),
		i(4, "// body"),
		t("\n"),
		t("endfunction\n"),
	}),

	-- Task
	s("task", {
		t("task "),
		i(1, "task_name"),
		t(";\n"),
		t("  "),
		i(2, "// body"),
		t("\n"),
		t("endtask\n"),
	}),
})

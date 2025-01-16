local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("json", {
	-- Objeto JSON básico
	s("object", {
		t('{\n    "'),
		i(1, "key"),
		t('": "'),
		i(2, "value"),
		t('"\n}'),
	}),

	-- Par clave-valor
	s("pair", {
		t('"'),
		i(1, "key"),
		t('": "'),
		i(2, "value"),
		t('"'),
	}),

	-- Lista de objetos
	s("array", {
		t('[\n    {\n        "'),
		i(1, "key1"),
		t('": "'),
		i(2, "value1"),
		t('"\n    },\n    {\n        "'),
		i(3, "key2"),
		t('": "'),
		i(4, "value2"),
		t('"\n    }\n]'),
	}),

	-- Configuración básica
	s("config", {
		t('{\n    "'),
		i(1, "setting"),
		t('": '),
		i(2, "value"),
		t(',\n    "'),
		i(3, "anotherSetting"),
		t('": "'),
		i(4, "anotherValue"),
		t('"\n}'),
	}),

	-- Esquema de ejemplo
	s("schema", {
		t('{\n    "$schema": "'),
		i(1, "https://json-schema.org/draft/2020-12/schema"),
		t('",\n    "title": "'),
		i(2, "Example Schema"),
		t('",\n    "type": "'),
		i(3, "object"),
		t('",\n    "properties": {\n        "'),
		i(4, "propertyName"),
		t('": {\n            "type": "'),
		i(5, "string"),
		t('"\n        }\n    }\n}'),
	}),

	-- Lista de valores
	s("list", {
		t('[\n    "'),
		i(1, "value1"),
		t('",\n    "'),
		i(2, "value2"),
		t('",\n    "'),
		i(3, "value3"),
		t('"\n]'),
	}),

	-- Mapeo anidado
	s("nested", {
		t('{\n    "'),
		i(1, "parentKey"),
		t('": {\n        "'),
		i(2, "childKey"),
		t('": "'),
		i(3, "value"),
		t('"\n    }\n}'),
	}),

	-- Configuración con comentarios
	s("commentedConfig", {
		t("{\n    // "),
		i(1, "Comment about the setting"),
		t('\n    "'),
		i(2, "key"),
		t('": "'),
		i(3, "value"),
		t('"\n}'),
	}),
})

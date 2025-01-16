local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("yaml", {
	-- Clave-valor
	s("pair", {
		t(""),
		i(1, "key"),
		t(": "),
		i(2, "value"),
	}),

	-- Lista
	s("list", {
		t("- "),
		i(1, "item1"),
		t("\n- "),
		i(2, "item2"),
		t("\n- "),
		i(3, "item3"),
	}),

	-- Mapeo anidado
	s("nested", {
		t(""),
		i(1, "parentKey"),
		t(":\n  "),
		i(2, "childKey"),
		t(": "),
		i(3, "value"),
	}),

	-- Configuración básica
	s("config", {
		t(""),
		i(1, "key1"),
		t(": "),
		i(2, "value1"),
		t("\n"),
		i(3, "key2"),
		t(": "),
		i(4, "value2"),
	}),

	-- Kubernetes Pod
	s("k8sPod", {
		t("apiVersion: v1\nkind: Pod\nmetadata:\n  name: "),
		i(1, "pod-name"),
		t("\nspec:\n  containers:\n  - name: "),
		i(2, "container-name"),
		t("\n    image: "),
		i(3, "image-name"),
		t("\n    ports:\n    - containerPort: "),
		i(4, "80"),
	}),

	-- Docker Compose Service
	s("dockerCompose", {
		t('version: "3.9"\nservices:\n  '),
		i(1, "service-name"),
		t(":\n    image: "),
		i(2, "image-name"),
		t('\n    ports:\n      - "'),
		i(3, "8080:80"),
		t('"\n    volumes:\n      - '),
		i(4, "./data:/app/data"),
	}),

	-- Ansible Task
	s("ansibleTask", {
		t("- name: "),
		i(1, "Task name"),
		t("\n  "),
		i(2, "module_name"),
		t(":\n    "),
		i(3, "key: value"),
	}),

	-- CI/CD Pipeline
	s("pipeline", {
		t("stages:\n  - "),
		i(1, "build"),
		t("\n  - "),
		i(2, "test"),
		t("\njobs:\n  "),
		i(3, "build-job"),
		t(":\n    stage: "),
		i(1),
		t("\n    script:\n      - "),
		i(4, "echo Build process"),
	}),

	-- Comentario
	s("comment", {
		t("# "),
		i(1, "Comentario"),
	}),

	-- Esquema de ejemplo
	s("schema", {
		t("$schema: "),
		i(1, "https://json-schema.org/draft/2020-12/schema"),
		t("\ntype: "),
		i(2, "object"),
		t("\nproperties:\n  "),
		i(3, "propertyName"),
		t(":\n    type: "),
		i(4, "string"),
	}),

	-- Variables
	s("var", {
		t("variables:\n  "),
		i(1, "key"),
		t(": "),
		i(2, "value"),
	}),
})

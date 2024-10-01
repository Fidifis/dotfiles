return {
	lua_ls = {},
	marksman = {},
	html = {},
	cssls = {},
	ts_ls = {},
	tailwindcss = {},
	terraformls = {},
	tflint = {},
	rust_analyzer = {},
	jedi_language_server = {}, -- Python
	bashls = {},
	jsonls = {},
	yamlls = {},
	dockerls = {},
	helm_ls = {
		settings = {
			["helm-ls"] = {
				yamlls = {
					path = "yaml-language-server",
				},
			},
		},
	},
}

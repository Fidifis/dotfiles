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
	pyright = {
    -- https://github.com/microsoft/pyright/blob/main/docs/settings.md
		settings = {
			python = {
				analysis = {
          autoImportCompletion = true,
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					useLibraryCodeForTypes = true,
					typeCheckingMode = "standard",
          diagnosticSeverityOverrides = {
            reportGeneralTypeIssues  = "warning",
          }
				},
			},
		},
	},
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

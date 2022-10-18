require("mleonidas/packer")
require("mleonidas/lsp_cmp")
require("mleonidas/lsp")
require("mleonidas/statusline")
require("mleonidas/octo")
require("mleonidas/treesitter")
require("mleonidas/rest")
require("mleonidas/go")
require("mleonidas/debugger")
require("mleonidas/vgit")
require("mleonidas/todo_comments")
require("mleonidas/solarized")


local treesitter_migrate = function()
	local map = {
		["annotation"] = "TSAnnotation",

		["attribute"] = "TSAttribute",

		["boolean"] = "TSBoolean",

		["character"] = "TSCharacter",
		["character.special"] = "TSCharacterSpecial",

		["comment"] = "TSComment",

		["conditional"] = "TSConditional",

		["constant"] = "TSConstant",
		["constant.builtin"] = "TSConstBuiltin",
		["constant.macro"] = "TSConstMacro",

		["constructor"] = "TSConstructor",

		["debug"] = "TSDebug",
		["define"] = "TSDefine",

		["error"] = "TSError",
		["exception"] = "TSException",

		["field"] = "TSField",

		["float"] = "TSFloat",

		["function"] = "TSFunction",
		["function.call"] = "TSFunctionCall",
		["function.builtin"] = "TSFuncBuiltin",
		["function.macro"] = "TSFuncMacro",

		["include"] = "TSInclude",

		["keyword"] = "TSKeyword",
		["keyword.function"] = "TSKeywordFunction",
		["keyword.operator"] = "TSKeywordOperator",
		["keyword.return"] = "TSKeywordReturn",

		["label"] = "TSLabel",

		["method"] = "TSMethod",
		["method.call"] = "TSMethodCall",

		["namespace"] = "TSNamespace",

		["none"] = "TSNone",
		["number"] = "TSNumber",

		["operator"] = "TSOperator",

		["parameter"] = "TSParameter",
		["parameter.reference"] = "TSParameterReference",

		["preproc"] = "TSPreProc",

		["property"] = "TSProperty",

		["punctuation.delimiter"] = "TSPunctDelimiter",
		["punctuation.bracket"] = "TSPunctBracket",
		["punctuation.special"] = "TSPunctSpecial",

		["repeat"] = "TSRepeat",

		["storageclass"] = "TSStorageClass",

		["string"] = "TSString",
		["string.regex"] = "TSStringRegex",
		["string.escape"] = "TSStringEscape",
		["string.special"] = "TSStringSpecial",

		["symbol"] = "TSSymbol",

		["tag"] = "TSTag",
		["tag.attribute"] = "TSTagAttribute",
		["tag.delimiter"] = "TSTagDelimiter",

		["text"] = "TSText",
		["text.strong"] = "TSStrong",
		["text.emphasis"] = "TSEmphasis",
		["text.underline"] = "TSUnderline",
		["text.strike"] = "TSStrike",
		["text.title"] = "TSTitle",
		["text.literal"] = "TSLiteral",
		["text.uri"] = "TSURI",
		["text.math"] = "TSMath",
		["text.reference"] = "TSTextReference",
		["text.environment"] = "TSEnvironment",
		["text.environment.name"] = "TSEnvironmentName",

		["text.note"] = "TSNote",
		["text.warning"] = "TSWarning",
		["text.danger"] = "TSDanger",

		["todo"] = "TSTodo",

		["type"] = "TSType",
		["type.builtin"] = "TSTypeBuiltin",
		["type.qualifier"] = "TSTypeQualifier",
		["type.definition"] = "TSTypeDefinition",

		["variable"] = "TSVariable",
		["variable.builtin"] = "TSVariableBuiltin",
	}

    for capture, hlgroup in pairs(map) do
		vim.api.nvim_set_hl(0, "@" .. capture, { link = hlgroup, default = true })
	end
end

treesitter_migrate()

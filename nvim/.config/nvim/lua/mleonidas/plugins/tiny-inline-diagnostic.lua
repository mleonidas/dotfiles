return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "LspAttach",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "powerline",
			-- signs = {
			-- 	left = "",
			-- 	right = "",
			-- 	diag = "●",
			-- 	arrow = "    ",
			-- 	up_arrow = "    ",
			-- 	vertical = " │",
			-- 	vertical_end = " └",
			-- },
			blend = {
				factor = 0.22,
			},
			options = {
				show_source = true,
				multilines = {
					enabled = true,
					always_show = false,
				},
				show_all_diags_on_cursorline = true,
				enable_on_insert = false,
			},
		})
	end,
}

vim.g.better_whitespace_filetypes_blacklist = {
	"neogitstatus",
	"NeogitCommitMessage",
	"diff",
	"git",
	"gitcommit",
	"unite",
	"qf",
	"help",
	"markdown",
	"fugitive",
	"terminal",
}
vim.g.strip_whitespace_on_save = 1
vim.g.strip_whitespace_confirm = 0
vim.g.terraform_align = 1
vim.g.terraform_fmt_on_save = 1

-- vim.filetype.add({
-- 	extension = {
-- 		tf = "terraform",
-- 		tfvars = "terraform-vars",
-- 		tfstate = "json",
-- 	},
-- })

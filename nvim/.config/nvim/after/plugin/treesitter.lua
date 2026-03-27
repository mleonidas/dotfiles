local ok, ts = pcall(require, "nvim-treesitter")
if not ok then
    print("Warning: treesitter not available, skipping configuration.")
    return
end

-- Tiltfile / .tilt filetype detection
vim.filetype.add({
    filename = { Tiltfile = "tiltfile" },
    extension = { tilt = "tiltfile" },
})

-- Tilt uses Starlark (Python dialect) — reuse the python parser
vim.treesitter.language.register("python", "tiltfile")

local parsers_to_install = {
    "lua",
    "vim",
    "vimdoc",
    "python",
    "go",
    "json",
    "http",
    "ruby",
    "sql",
    "graphql",
    "markdown",
    "markdown_inline",
    "rust",
    "cue",
    "jq",
    "json",
    "yaml",
    "nix",
    "regex",
    "gomod",
    "gosum",
    "gowork",
    "gotmpl",
    "graphql",
    "bash",
    "comment",
    "proto",
    "hcl",
    "make",
    "dockerfile",
    "gitcommit",
    "gitignore",
    "gitattributes",
    "git_rebase",
    "git_config",
    "typescript",
}

if vim.fn.has("mac") > 0 then
    -- Disable 'dockerfile' until nvim-treesitter/nvim-treesitter#3515 is resolved
    parsers_to_install = vim.tbl_filter(function(x)
        return x ~= "dockerfile"
    end, parsers_to_install)
end

-- Install parsers using the new API (async to not block startup)
vim.schedule(function()
    require("nvim-treesitter").install(parsers_to_install)
end)

-- Configure highlight to be enabled for all buffers
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})
-- require("nvim-treesitter.install").compilers = { "clang", "zig", "gcc" }

-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
--
-- parser_config.zed = {
--     install_info = {
--         url = "/Users/mleone/Documents/repos/personal/tree-sitter-authzed", -- local path or git repo
--         files = { "src/parser.c" },                                   -- Or other relevant
--         branch = "main",
--         requires_generate_from_grammar = false,
--         generate_requires_npm = false,
--     },
--     filetype = "zed", -- if filetype does not match the parser name
-- }
--
-- vim.api.nvim_command([[autocmd BufNewFile,BufRead *.zed setfiletype authzed]])

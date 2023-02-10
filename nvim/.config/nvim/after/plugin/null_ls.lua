local status, null_ls = pcall(require, "null-ls")

if (not  status) then return end

null_ls.setup {
    sources = {
        null_ls.builtins.formatting.prettierd,
    }
}

local status_p, prettier = pcall(require, "prettier")
if (not status_p) then return end

prettier.setup {
    bin = 'prettierd',
    filetypes = {
        "css",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "scss",
        "less"
    }
}

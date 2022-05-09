
augroup Python
    autocmd!
     au FileType py lua require'nvim-treesitter.configs'.setup { indent = { enable = true }, highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}
augroup END

hi! li pythonTSConstant Keyword
hi! li pythonTSBoolean Todo

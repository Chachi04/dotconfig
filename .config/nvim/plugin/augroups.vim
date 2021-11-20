fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
augroup DeleteWhiteSpaces
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" augroup fmt
"     autocmd!
"     autocmd BufWritePre * try | undojoin | silent Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
" augroup END

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require('vim.highlight').on_yank({timeout = 100})
augroup END

augroup CompilePacker
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup END

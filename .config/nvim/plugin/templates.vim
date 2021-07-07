augroup Templates

    autocmd!
    " read in template files
    autocmd BufNewFile *.* silent! execute '0r ~/.config/nvim/skeletons/skeleton.'.expand("<afile>:e")

    " parse special text in the templates after the read
    autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge

augroup END

augroup Cpp
    autocmd!
    autocmd VimEnter *.cpp command Run lua require"config.term".cpp()
augroup END


function! RunPython()
    let file = expand("%")
    call TermToggle(12)
    let term_id = b:terminal_job_id
    call jobsend(term_id, "python3 " . file . "\n")
endfunction

" augroup Python
"     autocmd!
"     autocmd VimEnter *.py command Run :call RunPython()
" augroup END

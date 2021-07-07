"  #######################################################################
"  ##          ______                      __     __  _                 ##
"  ##         / ____/___  ____ ___  ____  / /__  / /_(_)___  ____       ##
"  ##        / /   / __ \/ __ `__ \/ __ \/ / _ \/ __/ / __ \/ __ \      ##
"  ##       / /___/ /_/ / / / / / / /_/ / /  __/ /_/ / /_/ / / / /      ##
"  ##       \____/\____/_/ /_/ /_/ .___/_/\___/\__/_/\____/_/ /_/       ##
"  ##                           /_/                                     ##
"  ##                                                                   ##
"  #######################################################################


inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"


imap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : pumvisible() ? '<C-n>' : '<Tab>'
smap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : pumvisible() ? '<C-n>' : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-p>'
smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-p>'
let g:vsnip_snippet_dir="~/.config/nvim/snippets"


" inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR> compe#confirm('<CR>')
" inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"


augroup ClosePreview
    autocmd!
    autocmd CompleteDone * if !pumvisible() | pclose | endif
augroup END




" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall
" let g:user_emmet_leader_key='<C-m>'

" au User lsp_setup call lsp#register_server({
"      \ 'name': 'kite',
"      \ 'cmd': '~/.local/share/kite/current/kite-lsp --editor=nvim',
"      \ 'whitelist': ["php", "javascript", "python", "bash"],
"      \ })
" let g:kite_completions = 0
" let g:kite_snippets = 1
" let g:kite_previous_placeholder = '<C-h>'
" let g:kite_next_placeholder = '<C-l>'
" let g:kite_supported_languages = ['*']

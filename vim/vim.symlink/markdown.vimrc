" Markdown Header and Format Bindings

" nmap <leader>i bysw*
" imap <leader>i <Esc>bysw*i
nmap <leader>h1 yyp0v$r=
imap <leader>h1 <Esc>yyp0v$r=A
nmap <leader>h2 yyp0v$r-
imap <leader>h2 <Esc>yyp0v$r-A
nmap <leader>h3 0i###<Space><Esc>
imap <leader>h3 <Esc>0i###<Space><Esc>A
nmap <leader>h4 0i####<Space><Esc>
imap <leader>h4 <Esc>0i####<Space><Esc>A

vmap <leader>lb :s/\n/  \r/<cr>

" Create in-line link with visually selected text and URL on system clipboard
" Replicated by vim-pandoc plugin
" vmap <leader>l di[<Esc>pi](<Esc>:call setreg("\"",system("pbpaste"))<CR>pa)<Esc>


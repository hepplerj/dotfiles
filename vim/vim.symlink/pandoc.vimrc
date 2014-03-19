au BufNewFile,BufRead *.markdown,*.md,*.mkd,*.pd,*.pdc,*.pdk,*.pandoc,*.text,*.txt,*.page   set filetype=pandoc
" Find the space before Pandoc footnotes
nnoremap <leader><space> /\v^$\n[\^1\]:<CR>:let @/ = ""<CR>

" Turn off vim-pandoc section folding
let g:pandoc_no_folding = 1

" Preview buffer in browser after passing through pandoc
" http://rtomayko.github.com/bcat/bcat.1.html#EXAMPLES

" Highlight markers in text
" Thanks to Lincoln Mullen
match Error '{\w\+}'

" Convert pandoc buffer to HTML and copy to system clipboard
" Thanks to LM
autocmd FileType pandoc nnoremap <buffer> <C-S-x> :write \| let @+ = system("pandoc -t html " . shellescape(expand("%:p")))<CR>

" Format text
" Thanks to Lincoln Mullen
setlocal equalprg=pandoc\ -t\ markdown\ --reference-links\ --atx-headers

nmap <leader>v :!pandoc -t html --smart --include-in-header=/Users/jheppler/.pandoc/marked.css % \|bcat<cr><cr>

" Convert buffer to html from markdown
nmap <leader>h :%!pandoc -f markdown -t html

" Command to call Pandoc and process working file, using functions below
command! -nargs=* Pan execute ":call Pan<args>()"
nmap <leader>p :Pan 

" Functions to pass file through pandoc
function! PanPdf()
   exec ":! pandoc -o ~/Desktop/" . fnameescape(expand('%:t:r')) . ".pdf " . fnameescape(expand('%:p'))
endfunction

function! PanRtf()
   exec ":! pandoc -s -S -t rtf -o ~/Desktop/" . fnameescape(expand('%:t:r')) . ".rtf " . fnameescape(expand('%:p'))
endfunction

function! PanSyllabus()
   exec ":! pandoc -s -S --template=syllabus.tex -o ~/Desktop/" . fnameescape(expand('%:t:r')) . ".pdf " . fnameescape(expand('%:p'))
endfunction

function! PanDocx()
   exec ":! makebib;pandoc -s -S -t docx --reference-docx=/Users/jheppler/.pandoc/reference.docx --bibliography=/Users/jheppler/Dropbox/research/bib/master.bib -o ~/Desktop/" . fnameescape(expand('%:t:r')) . ".docx " . fnameescape(expand('%:p'))
endfunction

function! PanBib()
   exec ":! makebib;pandoc -s -S -t markdown --bibliography=/Users/jheppler/Dropbox/research/bib/master.bib . fnameescape(expand('%:p'))"
endfunction

" Change regular pandoc footnotes to inline notes
" Hat-tip to @udioioca at http://vimgolf.com/challenges/5014b2156318a4000200000b
nmap <leader>fn qn/[^<cr>*W"fd}d{N%ct]^[<C-R>f<Esc>gq{q


" Commit all changes in research wiki
command! -nargs=0 Wiki call CommitToWiki()
nnoremap _wc :call CommitToWiki()<CR>
function! CommitToWiki()
  :silent !cd ~/acad/research/wiki/wikidata && git --git-dir=/home/lmullen/acad/research/wiki/wikidata/.git --no-pager add *.page && git --git-dir=/home/lmullen/acad/research/wiki/wikidata/.git commit -a -m "Automatic commit from Vim" 
endfunction

" Make the BibTeX bibliography
command! -nargs=0 Bib call MakeBib()
nnoremap _bib :call MakeBib()<CR>
function! MakeBib()
  :silent !cd ~/acad/research/bib && Rake
  :redraw!
endfunction

" Find related Pandoc footnote numbers
" -------------------------------------------------------------------
" Vim's * key searches for the next instance of the word under the 
" cursor; Vim decides what counts as the boundary of a word with the 
" iskeyword option. This function toggles the special characters of a 
" Pandoc footnote in the form [^1] to allow you to jump between 
" footnotes with the * key.
nnoremap _fn :call ToggleFootnoteJumping()<CR>
function! ToggleFootnoteJumping()
  if exists("g:FootnoteJumping") 
    if g:FootnoteJumping == 1
      set iskeyword-=[
      set iskeyword-=]
      set iskeyword-=^
      let g:FootnoteJumping = 0
    else
      set iskeyword+=[
      set iskeyword+=]
      set iskeyword+=^
      let g:FootnoteJumping = 1
    endif
  else 
    set iskeyword+=[
    set iskeyword+=]
    set iskeyword+=^
    let g:FootnoteJumping = 1
  endif
endfunction

" bibkeys - launch with CTRL-X CTRL-K
" via https://github.com/lmullen/bibkeys
set dictionary=$HOME/acad/research/bib/citekeys.txt
set complete+=k

" Find text markers
nnoremap <leader>{ :vimgrep /{\w\+}/ %<CR>:copen<CR>

" auto commands
:autocmd BufWrite *.py %retab   " retab python files

" CTRL-P (`;`)
nmap ; :CtrlPBuffer<CR>
let g:ctrlp_map = '<leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
"let g:ctrlp_cache_dir = ~/.cache/ctrlp

" NERDTree (`,d`)
augroup ps_nerdtree
    au!

    au Filetype nerdtree setlocal nolist
    au Filetype nerdtree nnoremap <buffer> K :q<cr>
augroup END
let NERDTreeHighlightCursorline = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
map <leader>d :NERDTreeToggle<CR>

" NERDCommenter
map <leader>cc NERDCommenterToggle<CR>

" Strip trailing white space (`,ss`)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

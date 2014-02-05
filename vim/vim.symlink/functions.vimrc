" Commit all changes in research wiki
command! -nargs=0 Wiki call CommitToWiki()
nnoremap _wc :call CommitToWiki()<CR>
function! CommitToWiki()
  :silent !cd ~/Dropbox/research/dissertation/wiki/wikidata && git --git-dir=/Users/jheppler/Dropbox/research/dissertation/wiki/wikidata/.git --no-pager add *.page && git --git-dir=/Users/jheppler/Dropbox/research/dissertation/wiki/wikidata/.git commit -a -m "Automatic commit from Vim" 
endfunction

" Make the BibTeX bibliography
command! -nargs=0 Bib call MakeBib()
nnoremap _bib :call MakeBib()<CR>
function! MakeBib()
  :silent !cd ~/Dropbox/research/bib && Rake
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
set dictionary=$HOME/Dropbox/research/bib/citekeys.txt
set complete+=k

" Find text markers
nnoremap <leader>{ :vimgrep /{\w\+}/ %<CR>:copen<CR>

" auto commands
:autocmd BufWrite *.py %retab   " retab python files

" Strip trailing white space (`,ss`)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

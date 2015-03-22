" Commit all changes in research wiki
command! -nargs=0 Wiki call CommitToWiki()
nnoremap _wc :call CommitToWiki()<CR>
function! CommitToWiki()
  :silent !cd ~/acad/dissertation/wiki/wikidata && git --git-dir=/Users/jheppler/acad/dissertation/wiki/wikidata/.git --no-pager add *.page && git --git-dir=/Users/jheppler/acad/dissertation/wiki/wikidata/.git commit -a -m "Automatic commit from Vim" 
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
set dictionary=$HOME/acad/bib/citekeys.txt
set complete+=k

" Find text markers
"nnoremap <leader>{ :vimgrep /{\w\+}/ %<CR>:copen<CR>

" auto commands
":autocmd BufWrite *.py %retab   " retab python files

" Strip trailing white space (`_sw`)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap _sw :call StripWhitespace()<CR>

" convert smart typographical symbols to Markdown standards
nnoremap _md :silent! call CleanMarkdown()<CR>
function! CleanMarkdown()
  :%s/—/---/ge 
  :%s/–/--/ge
  :%s/…/.../ge
  :%s/’/'/ge
  :%s/“/"/ge
  :%s/‘/'/ge
  :%s/”/"/ge
  :%s/
//ge
  :%s/``/"/ge
  :%s/''/"/ge
  " The space replaced below is a non-breaking space commonly used before the 
  " colon in a title in library catalogs. It breaks pdfLaTeX.
  :%s/ :/:/ge
endfunction

" put an en dash between number ranges
nnoremap _en :call EnDashRange()<CR>
function! EnDashRange()
  :%s/\v(\d)-(\d)/\1--\2/ge
endfunction

command! -nargs=0 BG call ToggleBackground()
function! ToggleBackground()
  if &background == "dark"
    set background=light
  else
    set background=dark
  endif
endfunction

" Open the current note file in the browser
command! -nargs=0 Wo call OpenCurrentNoteInWiki()
function! OpenCurrentNoteInWiki()
  silent !xdg-open "http://localhost:5001/%:r"
endfunction

" Open the current file in the browser with the file system
command! -nargs=0 OpenInChromeWithFileSystem call OpenInChromeWithFileSystem()
function! OpenInChromeWithFileSystem()
  silent !google-chrome "%:p"
endfunction

" Open the current note file in the browser with localhost
command! -nargs=0 OpenInChromeWithLocalhost call OpenInChromeWithLocalhost()
function! OpenInChromeWithLocalhost()
  silent !google-chrome "http://localhost:4000/%"
endfunction

" Navigate to a Pandoc footnote 
command! -nargs=* Fn call GoToFootnote(<f-args>)
function! GoToFootnote(footnote, ...)
  let definition = ''
  if a:0 > 0
    let definition = a:1
  endif
  call search('\[\^' . a:footnote . '\]' . definition)
endfunction

command! -nargs=0 AbbreviateMonths call AbbreviateMonths()
function! AbbreviateMonths()
  :%s/January/Jan./g
  :%s/February/Feb./g
  :%s/March/Mar./g
  :%s/April/Apr./g
  :%s/May/May/g
  :%s/June/June/g
  :%s/July/July/g
  :%s/August/Aug./g
  :%s/September/Sept./g
  :%s/October/Oct./g
  :%s/November/Nov./g
  :%s/December/Dec./g
endfunction

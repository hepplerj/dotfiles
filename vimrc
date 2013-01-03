" Jason Heppler vimrc

call pathogen#runtime_append_all_bundles() 
call pathogen#helptags()

set nocompatible                " choose no compatibility with legacy vi
syntax on
set encoding=utf-8
set showcmd
filetype plugin indent on

" whitespace
set tabstop=4 shiftwidth=4      " tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
set list
set list listchars=tab:\ \ ,trail:·

" toggle automatic hardwrapping 
nmap <silent> <leader>wa :set fo-=a<CR> 
nmap <silent> <leader>aw :set fo+=a<CR>

" remove line breaks within paragraphs (softwrap)
" http://superuser.com/questions/200423/join-lines-inside-paragraphs-in-vim
nmap <silent> <leader>sw Go<Esc>:3,$g/^./ .,/^$/-1 join<CR>
" straighten quotes
nmap <leader>q :exe '%s/[“”]/"/eg'<cr>:exe "%s/[‘’]/'/eg"<cr>:nohlsearch<cr>

" auto commands
:autocmd BufWrite *.py %retab   " retab python files

" abbreviations
:iabbrev ppython #!/usr/bin/env python <cr>#-*- coding: utf-8 -*-
:iabbrev rruby #!/usr/bin/env ruby<cr>

" searching
set hlsearch                    " highlight matches
set incsearch                   " incremental search
set ignorecase                  " case insensitive
set smartcase
nnoremap <CR> :noh<CR>          " remove search highlight

" mappings
let mapleader = ","
noremap! jj <Esc>
nmap <leader>g :GundoToggle<CR>

" NERDTree
augroup ps_nerdtree
    au!

    au Filetype nerdtree setlocal nolist
    au Filetype nerdtree nnoremap <buffer> K :q<cr>
augroup END

let NERDTreeHighlightCursorline = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

map <leader>d :NERDTreeToggle<CR>

" buffer navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" colorscheme
syntax enable
let g:solarized_termtrans=1
colorscheme solarized
set background=dark
call togglebg#map("<F6>") " need to get this working

set laststatus=2

" Marked.app
:nnoremap <leader>ma :silent !open -a Marked.app '%:p' :redraw!<cr>

" enable fancy mode
let g:Powerline_symbols = 'fancy'

" Visuals
set number
set colorcolumn=81
set cursorline
nmap <leader>ev :vsplit $MYVIMRC<cr> " mapping to edit vimrc quickly
nmap <leader>sv :source $MYVIMRC<cr> " mapping to source vimrc quickly

" writing mode
func! WordProcessorMode()
    setlocal formatoptions=t1
    setlocal textwidth=100
    map j gj
    map k gk
    setlocal spell spelllang=en_us
    setlocal noexpandtab
    set tw=72
    set fo=cqt
    set wm=0
endfu
com! WP call WordProcessorMode()

" iawriter color scheme
" turn on with F4
let g:fullscreen_colorscheme = "iawriter"
let g:fullscreen_font = "Cousine:h14"

" bibkeys
" via https://github.com/lmullen/bibkeys
" launch with CTRL-X CTRL-K
set dictionary=$HOME/bib/citekeys.txt
set complete+=k

" Find text markers
nnoremap <leader>{ :vimgrep /{\w\+}/ %<CR>:copen<CR>

" Some file types should wrap their text
function! s:setupWrapping()
    set wrap
    set linebreak
    set textwidth=72
    set nolist
endfunction

if has("autocmd")
    " Make sure all mardown files have the correct filetype set and setup wrapping
    au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()
endif

" Source configuration files
nmap <leader>sv :source %<cr>
source $HOME/.vim/bibtex.vimrc
source $HOME/.vim/gitit.vimrc
source $HOME/.vim/markdown.vimrc
source $HOME/.vim/pandoc.vimrc

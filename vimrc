" Jason Heppler vimrc

call pathogen#runtime_append_all_bundles() 
call pathogen#helptags()

set nocompatible                " choose no compatibility with legacy vi
syntax on
set encoding=utf-8
set showcmd
filetype plugin indent on

" whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
set list
set list listchars=tab:\ \ ,trail:·

" MacVim settings
:set guifont=Monaco:h12

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
nmap <leader>q :q<cr>           " fast quit
nmap <leader>tb :TagbarToggle<CR>
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
colorscheme tomorrow_night

set laststatus=2

" Marked.app
:nnoremap <leader>ma :silent !open -a Marked.app '%:p'<CR>

" enable fancy mode
let g:Powerline_symbols = 'fancy'

"SWAGG
set relativenumber
set colorcolumn=81
set cursorline
nmap <leader>ev :vsplit $MYVIMRC<cr> " mapping to edit vimrc quickly
nmap <leader>sv :source $MYVIMRC<cr> " mapping to source vimrc quickly

" writing
func! WordProcessorMode()
    setlocal formatoptions=1
    setlocal noexpandtab
    map j gj
    map k gk
    setlocal spell spelllang=en_us
    set thesaurus+=/Users/hepplerj/.vim/thesarus/thesaur.txt
    set complete+=s
    set formatprg=par
    setlocal wrap
    setlocal linebreak
endfu
com! WP call WordProcessorMode()

" bibkeys
set dictionary=$HOME/bib/citekeys.txt
set complete+=k

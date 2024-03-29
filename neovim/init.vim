" Neovim configuration
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
" .vimrc of Jason Heppler <jason@jasonheppler.org>
" built for use with nvim
" http://github.com/hepplerj/dotfiles/
" last updated: 2022-11-18
"
" Mapping
"--------------------------------------------------------------------------
let mapleader = ","

" Buffer navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" I want `j` and `k` to work visually, where `down` means the next line
map j gj
map k gk

" I'd rather not reach; escape with `jj`
noremap! jj <Esc>

" Fast saving
nmap <leader>w :w!<cr>

" Plugins
"--------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'justinmk/vim-dirvish'

Plug 'tpope/vim-fugitive'
  nmap <Leader>git :Git<CR>gg<c-n>
  nnoremap <Leader>gd :Gdiff<CR>
Plug 'tpope/vim-commentary'
  map gc <Plug>Commentary
  nmap gcc <Plug>CommentaryLine
Plug 'preservim/nerdcommenter' " Plugin for intensely nerdy commenting powers
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Git
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-eunuch'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/gist-vim'

" JavaScript
Plug 'jiangmiao/auto-pairs'
Plug 'kevinoid/vim-jsonc' " Syntax support for JSON with C-style comments
Plug 'gavocanov/vim-js-indent'
Plug 'pangloss/vim-javascript' " Syntax support for Javascript and better highlighting
Plug 'maxmellon/vim-jsx-pretty' " Syntax support for JSX and TSX
Plug 'hail2u/vim-css3-syntax'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' } " Syntax support for golang

" Searching
Plug 'mhinz/vim-grepper'
Plug '/opt/homebrew/bin/fzf'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Utilities
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'mattn/webapi-vim'
Plug 'davidoc/taskpaper.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  augroup nerd_loader
    autocmd!
    autocmd VimEnter * silent! autocmd! FileExplorer
    autocmd BufEnter,BufNew *
      \ if isdirectory(expand('<amatch>'))
      \|    call plug#load('nerdtree')
      \|    execute 'autocmd! nerd_loader'
      \| endif
  augroup END

" Syntax
Plug 'w0rp/ale'
Plug 'tmcw/vim-eslint-compiler'

" Color schemes
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'rmehri01/onenord.nvim', { 'branch' : 'main' }
Plug 'chriskempson/base16-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'juanedi/predawn.vim'
Plug 'mhinz/vim-janah'
Plug 'rakr/vim-two-firewatch'
Plug 'mhartington/oceanic-next'
Plug 'jnurmine/zenburn'
Plug 'junegunn/seoul256.vim'
Plug 'robertmeta/nofrils'
Plug 'Lokaltog/vim-monotone'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'          " Status bar
Plug 'vim-airline/vim-airline-themes'   " Applicable themes
Plug 'ap/vim-css-color'                 " color name highlighter

" Writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vim-pandoc/vim-markdownfootnotes'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

call plug#end()

set nocompatible

if has('autocmd')
  filetype plugin indent on    " enable plugins, detection and indenting
endif

if has('syntax') && !exists('g:syntax_on')
  syntax on
endif

set encoding=UTF-8

colorscheme iceberg

" Performance: highlighting ends after 400 columns
set synmaxcol=400

" Keybindings
"--------------------------------------------------------------------------
nnoremap <leader>n :NERDTreeToggle<cr>

nnoremap <C-k> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa<CR>
nmap <leader>a :GrepperRg 

autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufWinLeave * call clearmatches()

" General
"--------------------------------------------------------------------------
set title
set noerrorbells
set novisualbell
set number
set nu
set ignorecase                " ignore case when searching
set smartcase                 " try to be smart about cases
set incsearch                 " search act like modern browsers
set hlsearch                  " highlight search results
set colorcolumn=81
set wildmenu                  " turn on Wild Menu
set wildignore+=node_modules
set splitright
set timeoutlen=1000
set ttimeoutlen=0
set ttyfast
set showmode
set showcmd
set lazyredraw                " don't redraw when executing macros
set hidden
set ruler
set cmdheight=2
set backspace=indent,eol,start	" backspace through everything in insert mode
set showmatch
set mat=2
set smarttab
set history=1000
set undolevels=1000
set noswapfile
"set nowritebackup
"set undofile
"set undodir=~/.cache/undodir
set autoread                   " Set to auto read when file changed from outside
au FocusLost * :wa
set mouse=a 
set shortmess=I 

set backupdir=/tmp//,.
set directory=/tmp//,.
if has('persistent_undo')
  set undodir=/tmp,.
  set undofile
endif

" Appearance
"--------------------------------------------------------------------------
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'

  return '[%n] %F %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction
let &statusline = s:statusline_expr()

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Text formatting
"--------------------------------------------------------------------------
set wrap
set linebreak
set textwidth=78
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent
set shiftround
" Use Q to format paragraph
vnoremap Q gq
nnoremap Q gwap

set formatoptions=
set formatoptions-=t              " don't autowrap text
set formatoptions+=c              " do autowrap comments
set formatoptions+=r              " automatically continue comments
set formatoptions+=o              " automatically continue comments when hitting 'o' or 'O'
set formatoptions+=q              " allow formating of comments with 'gq'
set formatoptions+=n              " recognize numbered lists
set formatoptions+=l " don't break long lines that were already there

" Handle footnotes
imap <buffer> ]r <Plug>AddVimFootnote
nmap <buffer> ]r <Plug>AddVimFootnote
imap <buffer> [r <Plug>ReturnFromFootnote
nmap <buffer> [r <Plug>ReturnFromFootnote

" ----------------------------------------------------------------------------
" goyo.vim + limelight.vim
" ----------------------------------------------------------------------------
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
"let g:limelight_paragraph_span = 1
"let g:limelight_priority = -1

function! s:goyo_enter()
  if has('gui_running')
    set fullscreen
    set background=light
    set linespace=7
  elseif exists('$TMUX')
    silent !tmux set status off
  endif
  Limelight
  let &l:statusline = '%M'
  hi StatusLine ctermfg=red guifg=red cterm=NONE gui=NONE
endfunction

function! s:goyo_leave()
  if has('gui_running')
    set nofullscreen
    set background=dark
    set linespace=0
  elseif exists('$TMUX')
    silent !tmux set status on
  endif
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <Leader>G :Goyo<CR>

" ----------------------------------------------------------------------------
" Markdown headings
" ----------------------------------------------------------------------------
nnoremap <leader>1 m`yypVr=``
nnoremap <leader>2 m`yypVr-``
nnoremap <leader>3 m`^i### <esc>``4l
nnoremap <leader>4 m`^i#### <esc>``5l
nnoremap <leader>5 m`^i##### <esc>``6l

" ----------------------------------------------------------------------------
" Moving lines
" ----------------------------------------------------------------------------
nnoremap <silent> <C-k> :move-2<cr>
nnoremap <silent> <C-j> :move+<cr>
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-k> :move-2<cr>gv
xnoremap <silent> <C-j> :move'>+<cr>gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv
xnoremap < <gv
xnoremap > >gv

" Spell checking
" Press ,ss to toggle spell check
map <leader>ss :setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" fzf 
"--------------------------------------------------------------------------
set rtp+=/opt/homebrew/opt/fzf
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.3 } }

"" O for 'open'
nnoremap <silent> <leader>o :GFiles<CR> 
nnoremap <silent> <leader>O :FZF<CR> %<Tab>

let $FZF_DEFAULT_OPTS .= ' --inline-info'

" All files
command! -nargs=? -complete=dir AF
  \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
  \   'source': 'fd --type f --hidden --follow --exclude .git --no-ignore . '.expand(<q-args>)
  \ })))

let g:fzf_colors =
\ { 'fg':         ['fg', 'Normal'],
  \ 'bg':         ['bg', 'Normal'],
  \ 'preview-bg': ['bg', 'NormalFloat'],
  \ 'hl':         ['fg', 'Comment'],
  \ 'fg+':        ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':        ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':        ['fg', 'Statement'],
  \ 'info':       ['fg', 'PreProc'],
  \ 'border':     ['fg', 'Ignore'],
  \ 'prompt':     ['fg', 'Conditional'],
  \ 'pointer':    ['fg', 'Exception'],
  \ 'marker':     ['fg', 'Keyword'],
  \ 'spinner':    ['fg', 'Label'],
  \ 'header':     ['fg', 'Comment'] }

if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '-p90%,60%' }
else
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
endif

" nnoremap <silent> <Leader><Leader> :Files<CR>
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leaded><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>L        :Lines<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>`        :Marks<CR>
" nnoremap <silent> q: :History:<CR>
" nnoremap <silent> q/ :History/<CR>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <expr> <c-x><c-d> fzf#vim#complete#path('blsd')
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" vim-javascript
"--------------------------------------------------------------------------
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" mxw/vim-jsx
"--------------------------------------------------------------------------
let g:jsx_ext_required = 0

" Configure Gist
"--------------------------------------------------------------------------
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

let g:grepper = {}
let g:grepper.tools = ['rg']
let g:grepper.simple_prompt = 1
let g:grepper.quickfix = 1
let g:grepper.highlight = 1
let g:ale_lint_on_text_changed = 'never' " only lint when I save 
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_user_local_config = 1

autocmd BufReadPost quickfix noremap <silent> <buffer> o  <CR>
autocmd BufReadPost quickfix noremap <silent> <buffer> t  <C-w><CR><C-w>T
autocmd BufReadPost quickfix noremap <silent> <buffer> T  <C-w><CR><C-w>TgT<C-W><C-W>
autocmd BufReadPost quickfix noremap <silent> <buffer> v <C-w><CR><C-w>H<C-W>b<C-W>J<C-W>t

" vim markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['js=javascript']
let g:vim_markdown_frontmatter = 1

" Functions and Commands
" ----------------------------------------------------------------------------

" :Root | Change directory to the root of the Git repository
function! s:root()
  let root = systemlist('git rev-parse --show-toplevel')[0]
  if v:shell_error
    echo 'Not in git repo'
  else
    execute 'lcd' root
    echo 'Changed directory to: '.root
  endif
endfunction
command! Root call s:root()

" <F8> | Color scheme selector
function! s:rotate_colors()
  if !exists('s:colors')
    let s:colors = s:colors()
  endif
  let name = remove(s:colors, 0)
  call add(s:colors, name)
  execute 'colorscheme' name
  redraw
  echo name
endfunction
nnoremap <silent> <F8> :call <SID>rotate_colors()<cr>

" Todo
function! s:todo() abort
  let entries = []
  for cmd in ['git grep -niI -e TODO -e FIXME -e XXX 2> /dev/null',
            \ 'grep -rniI -e TODO -e FIXME -e XXX * 2> /dev/null']
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor

  if !empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction
command! Todo call s:todo()

" <Leader>?/! | Google it / Feeling lucky
function! s:goog(pat, lucky)
  let q = '"'.substitute(a:pat, '["\n]', ' ', 'g').'"'
  let q = substitute(q, '[[:punct:] ]',
       \ '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
  call system(printf('open "https://www.google.com/search?%sq=%s"',
                   \ a:lucky ? 'btnI&' : '', q))
endfunction

nnoremap <leader>? :call <SID>goog(expand("<cWORD>"), 0)<cr>
nnoremap <leader>! :call <SID>goog(expand("<cWORD>"), 1)<cr>
xnoremap <leader>? "gy:call <SID>goog(@g, 0)<cr>gv
xnoremap <leader>! "gy:call <SID>goog(@g, 1)<cr>gv

" Source configs
"--------------------------------------------------------------------------
nmap <leader>src :source %<cr>
source $HOME/.vim/abbreviations.vimrc
source $HOME/.vim/functions.vimrc

set secure "disables unsafe commands in project specific .vimrc


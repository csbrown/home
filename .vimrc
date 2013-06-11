" ----------------------------------------------------------------------------
" Preface
" ----------------------------------------------------------------------------

" Remove all autocommands for the current group.
autocmd!

call pathogen#infect()

" ----------------------------------------------------------------------------
" Formatting
" ----------------------------------------------------------------------------

" To insert a real tab, use CTRL-V<Tab>

" In insert mode, use 'tabstop' spaces when inserting a <Tab>.
set expandtab

" Number of spaces displayed for <Tab>.
set tabstop=8

" Number of spaces to use for each step of (auto)indent.  Used for 'cindent',
" '>>', '<<', etc.
set shiftwidth=4

" With 'smarttab' on, <Tab> indents with 'shiftwidth'.  When off, a <Tab>
" indents with 'tabstop' or 'softabstop'.
set smarttab

" Automatically break line at this column.
set textwidth=80

set formatoptions=tcqn1


" ----------------------------------------------------------------------------
" Appearance
" ----------------------------------------------------------------------------

"
" Highlights
"
set cursorline
set hlsearch


"
" Status Line
"
set laststatus=2  " Always display status line.
set showcmd
set ruler


"
" Misc
"
syntax on
set nowrap
set listchars=tab:>-,extends:%,precedes:%


" ----------------------------------------------------------------------------
" Mapc
" ----------------------------------------------------------------------------

let mapleader = ","

nnoremap <leader>erc :split $MYVIMRC<cr>
nnoremap <leader>src :source $MYVIMRC<cr>

noremap <leader>v :vsplitw
noremap <leader>s :splitw

map Y y$

" In command mode, <ENTER> behaves the same as in WYSIWYG editors.
map <CR> o<ESC>
map <S-CR> O<ESC>

" ----------------------------------------------------------------------------
" Filetypes
" ----------------------------------------------------------------------------

" Automatically detect filetype, and load its plugin and indent file.
filetype plugin indent on

autocmd BufRead,BufNewFile *.l,*.lpp set filetype=lex
autocmd BufRead,BufNewFile *.scala set filetype=scala
autocmd BufRead,BufNewFile *.y,*.ypp set filetype=yacc

" ----------------------------------------------------------------------------
" Misc
" ----------------------------------------------------------------------------

" Buffers remain open when hidden.
set hidden

" Don't leave litter lying around.
set nobackup
set nowritebackup
set noswapfile

" sessionoptions
"     - 'options' and 'localoptions' are mutually exclusive.
"     - 'sesdir' gives more predictable behavior thean 'curdir'.
set sessionoptions=buffers,folds,globals,help,localoptions,resize,tabpages,winpos,winsize

set backspace=indent,eol,start
set matchpairs+=<:>
set modeline
set spelllang=en_us
set visualbell
set wildmenu

" vim: et sw=4:

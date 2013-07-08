" {{{ Preamble
filetype off

set rtp+=~/vimfiles/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" }}}
" {{{ My Bundles
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/camelcasemotion'
Bundle 'ctrlp.vim'
Bundle 'snipMate'
Bundle 'The-NERD-Commenter'
Bundle 'Auto-Pairs'
" }}}
" {{{ Postamble
" File-type highlighting and configuration.
" Run :filetype to see what you may have
" to turn on yourself, or just set them all to be sure.
syntax on
filetype on
filetype plugin on
filetype indent on
" }}}
" {{{ Colorscheme
set background=dark
colorscheme blackboard
" }}}
" {{{ Misc
set autoindent			" Fallback indentation.
set backspace=indent,eol,start	" Allow backspacing over everything in insert mode.
set clipboard=unnamed		" Change the clipboard to use the unnamed
				" register so cut/paste works with Windows
				" without "* prefix
set foldmethod=marker		" Make Vim fold with the help of markers.
set guioptions=egLt		" Disable the menu, toolbar and scrollbar.
set hidden			" Allows hidden buffers
set hlsearch			" Highlight search patterns.
set ignorecase			" Ignore case.
set incsearch			" Enable visual display of incremental search;
				" a particular favourite of mine
set smartcase			" Ignore case when the pattern contains lowercase
				" letters only.
set laststatus=2		" Always show the statusline
set modeline
set shiftwidth=4		" Spaces for each step of (auto)indent.
set showbreak=…                 " Add an ellipsis at the start of wrapped lines.
set softtabstop=4		" Spaes that a <Tab> counts for when editing.
set smarttab
set textwidth=79		" Wrap on set column.
set visualbell			" Shut up the infernal beeping!
" }}}
" {{{ Powerline
" Powerline setup with my favourite font Consolas
" Instructions @ http://codejury.com/consolas-font-in-vim-powerline-windows/
set encoding=utf-8  " Necessary to show Unicode glyphs
set guifont=Consolas\ for\ Powerline\ FixedD:h9
let g:Powerline_symbols='fancy'
" }}}
set listchars=tab:▸\ ,eol:¬
" {{{ Suffic dependant autocommands
autocmd BufNewFile,BufRead *.c setlocal foldmethod=indent
autocmd BufNewFile,BufRead *.cpp setlocal foldmethod=indent
" }}}
" {{{ Filetype dependant autocommands
autocmd Filetype help nnoremap <buffer> <CR> <C-]>|
autocmd Filetype help nnoremap <buffer> <Backpace> <C-t>|
autocmd FileType gitcommit setlocal spell tw=72 complete+=k
" }}}
" {{{ Function keys
nnoremap <F1> :buffer #<CR>
nnoremap <F2> :CtrlPBuffer<CR>
nnoremap <F3> :CtrlPTag<CR>
nnoremap <F4> :CtrlPRoot<CR>
nnoremap <F5> :CtrlPMRU<CR>
" }}}

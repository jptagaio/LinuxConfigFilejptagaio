set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

if has('nvim')
	  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	  Plug 'Shougo/deoplete.nvim'
	    Plug 'roxma/nvim-yarp'
		   Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Syntax enable
set autoindent

" turn hybrid line numbers on
:set number relativenumber
:set nu rnu

" Speed up scrolling in Vim
set ttyfast

"Turn on syntax highlighting
syntax on

" Automatically wrap text that extends beyond the screen length
set wrap

" Set dracula as default theme
colorscheme dracula

" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Encoding
set encoding=utf-8

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Set tabstop to 3
set tabstop=3

" Set tabidentation to 3
set shiftwidth=3

" For tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Easy navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

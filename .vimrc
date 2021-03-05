set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/preservim/nerdtree'
Plugin 'https://github.com/ycm-core/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Syntax enable
set autoindent

" Show line numbers
set number

" Speed up scrolling in Vim
set ttyfast

"Turn on syntax highlighting
syntax on

" Automatically wrap text that extends beyond the screen length
set wrap

" Set Monokai as vim background color
" "colorscheme monokai

" Set Draculas as Vim theme
packadd! dracula
syntax enable
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

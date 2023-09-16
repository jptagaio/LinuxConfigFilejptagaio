set nocompatible              " be iMproved, required
filetype off                  " required

execute pathogen#infect()

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

" Bash language server
let g:ycm_language_server =
            \ [
                \   {
            \       'name': 'bash',
                \       'cmdline': [ 'bash-language-server', 'start' ],
            \       'filetypes': [ 'sh' ],
                \   }
            \ ]

set nocompatible              " be iMproved, required
filetype plugin on                  " required

let g:ale_completion_enabled = 1

call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'vimwiki/vimwiki'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'

call plug#end()

let g:deoplete#enable_at_startup = 1
set omnifunc=ale#completion#OmniFunc

"Set colorscheme
"colorscheme sierra
colorscheme dracula

" Syntax enable
set autoindent
set smartindent

" " turn hybrid line numbers on
:set number relativenumber

" " Speed up scrolling in Vim
set ttyfast

" "Turn on syntax highlighting
syntax on

" " Automatically wrap text that extends beyond the screen length
set wrap

" " Vim's auto indentation feature does not work properly with text copied
" from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" " Encoding
set encoding=utf-8

" " Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Set tabstop to 3
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Set tabidentation to 3
set shiftwidth=3

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <c-i> <Esc>:NERDTreeToggle<cr>
nnoremap <c-i> <Esc>:NERDTreeToggle<cr>

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Easy navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Tab movement
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

"vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': 'md'}]

"Restric vimwiki markdown files
let g:vimwiki_global_ext = 0

"Vim spell
hi clear SpellBad
hi SpellBad cterm=underline

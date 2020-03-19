set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
"================================================================================ 
" Plugin 'tmherdberg/SimpylFold'
" nerd tree
Plugin 'preservim/nerdtree'

"================================================================================ 
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" More Configs
"================================================================================ 
" Generic
"================================================================================ 
set encoding=utf-8
set number
set relativenumber
set nohls
" Split screen in a more natural way
set splitbelow
set splitright
" Set style in dir mode
let g:netrw_liststyle = 3

" Need nerd tree. 
" Auto start if no files is specify
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Auto close if nerd tree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Map shortcut to toggle NerdTree
map <C-n> :NERDTreeToggle<CR>
map g<C-n> :NERDTreeFind<CR>

" For editing VIMRC
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>


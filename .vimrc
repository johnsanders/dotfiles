set nocompatible
filetype off

let mapleader=","

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'marijnh/tern_for_vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'qpkorr/vim-bufkill'
Plugin 'jiangmiao/auto-pairs'
call vundle#end()

autocmd VimEnter * NERDTree			" Open NERDTree by default
autocmd VimEnter * wincmd p
autocmd CompleteDone * pclose		" Close autocomplete preview on select

" -- Display 
"set title                 " Update the title of your window or your  terminal
  set number                " Display line numbers
  set ruler                 " Display cursor position
  set wrap                  " Wrap lines when they are too long

  set scrolloff=3           " Display at least 3 lines around you cursor
                            " (for scrolling)

  set guioptions=T          " Enable the toolbar
  set tabstop=2
  set shiftwidth=0

" -- Search
  set ignorecase            " Ignore case when searching
  set smartcase             " If there is an  uppercase in your search term
                            " search case sensitive again
  set incsearch		    " Highlight search results when typing
  set hlsearch              " Highlight search  results

" -- Beep
  set visualbell	    " Prevent Vim from beeping
  set noerrorbells	    " Prevent Vim from beeping

" Backspace behaves as expected
 set backspace=indent,eol,start

" Hide buffer (file) instead of abandoning when switching to another buffer
set hidden

"Enable syntax highlihgting
syntax on

"Enable file-specific behavior like syntax highlighting and indentationi
filetype plugin on
filetype indent on

let g:solarized_termcolors=256
set t_Co=256
syntax enable
set background=dark
colorscheme solarized

"hidden files in Nerdtree
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.swp$']


:inoremap jj <Esc>
:nnoremap <Leader>w <C-w><C-w>
:nnoremap <leader>q <C-w>h

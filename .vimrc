set exrc secure
set nocompatible             
filetype off               

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'tpope/vim-repeat'

  Plugin 'Valloric/YouCompleteMe'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-commentary'
  Plugin 'easymotion/vim-easymotion'
  
  Plugin 'flazz/vim-colorschemes'
"  Plugin 'felixhummel/setcolors.vim'

call vundle#end()
  filetype plugin indent on

  set relativenumber
  set number

  set ruler
  set laststatus=2
  set showcmd
  set showmode

  set updatetime=250

  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set expandtab
  set linebreak
   
  syntax on
  colo distinguished

  ino jk <esc>
  nnoremap <F4> :make!<cr>

  set wmh=0
  map <C-j> <C-W>j
  map <C-k> <C-W>k
  map <C-h> <C-W>h
  map <C-l> <C-W>l
  map - <C-W>-
  map + <C-W>+
  map <M-<> <C-W><
  map <M->> <C-W>>

  let mapleader="\<Space>"
  let g:ycm_confirm_extra_conf = 0

  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
  let g:ctrlp_by_filename = 1
  let g:ctrlp_cmd = 'CtrlPMixed'

" EasyMotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0 

" any word
map <Leader>f <Plug>(easymotion-bd-w)
" any line
map <Leader>g <Plug>(easymotion-bd-jk)
" line below/above
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

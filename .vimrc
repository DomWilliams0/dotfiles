set exrc secure
set nocompatible             
filetype off               

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'

  Plugin 'Valloric/YouCompleteMe'
  Plugin 'airblade/vim-gitgutter'

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
  colo desert

  ino jk <esc>
  nnoremap <F4> :make!<cr>

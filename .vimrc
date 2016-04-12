set exrc secure
set nocompatible             
filetype off               

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'tpope/vim-repeat'

  Plugin 'Valloric/YouCompleteMe'
  " Plugin 'scrooloose/syntastic'
  Plugin 'bkad/CamelCaseMotion'
  " Plugin 'davidhalter/jedi-vim'
  " Plugin 'davidhalter/jedi'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-commentary'
  Plugin 'easymotion/vim-easymotion'
  Plugin 'vim-scripts/vim-auto-save'
  Plugin 'rednaks/vim-split_term'
  
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

set noexpandtab
set linebreak
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4

syntax on
colo distinguished

ino jk <esc>
nnoremap <F4> :make!<cr>
map <F2> :noh<cr>
map <M-Enter> :VsTerm<cr>

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

nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_by_filename = 1
let g:ctrlp_cmd = 'CtrlPMixed'

" EasyMotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0 

" any word
map <Leader>f <Plug>(easymotion-bd-w)
" any line
map <Leader>l <Plug>(easymotion-bd-jk)
" line below/above
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" jedi-vim with YCM
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1

let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0

" auto-save
let g:auto_save = 1
let g:auto_save_no_updatetime = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" camel case
call camelcasemotion#CreateMotionMappings('<leader>')

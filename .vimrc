set exrc secure
set nocompatible             
filetype off               
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'tpope/vim-repeat'

	Plugin 'Valloric/YouCompleteMe'
	Plugin 'maralla/completor.vim'
	Plugin 'neomake/neomake'
	" Plugin 'maralla/validator.vim'

	Plugin 'sheerun/vim-polyglot'
	Plugin 'bkad/CamelCaseMotion'
	" Plugin 'davidhalter/jedi-vim'
	" Plugin 'davidhalter/jedi'
	Plugin 'airblade/vim-gitgutter'
	Plugin 'ctrlpvim/ctrlp.vim'
	Plugin 'tpope/vim-surround'
	Plugin 'tpope/vim-commentary'
	Plugin 'easymotion/vim-easymotion'
	Plugin 'vim-scripts/vim-auto-save'

	Plugin 'flazz/vim-colorschemes'
	Plugin 'felixhummel/setcolors.vim'
	Plugin 'morhetz/gruvbox'
	Plugin 'NLKNguyen/papercolor-theme'
	Plugin 'NLKNguyen/c-syntax.vim'
	Plugin 'pangloss/vim-javascript'
	Plugin 'hdima/python-syntax'

	Plugin 'christoomey/vim-tmux-navigator'

	Plugin 'junegunn/vim-easy-align'
	Plugin 'dracula/vim'
	Plugin 'tyrannicaltoucan/vim-quantum'
	Plugin 'craigemery/vim-autotag'
	Plugin 'majutsushi/tagbar'

	Bundle 'lrvick/Conque-Shell'

call vundle#end()
filetype plugin indent on

set relativenumber
set number

set ruler
set laststatus=2
set showcmd
set showmode
set splitright splitbelow
set hlsearch
set incsearch

" set fdm=indent
" set foldnestmax=1

set updatetime=100

set noexpandtab
set linebreak
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4

syntax on
"colo gruvbox
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_contrast_light = "hard"
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }
colo PaperColor
set background=dark

ino jk <esc>
" nnoremap <F4> :make!<cr>
map <F2> :noh<cr>
map <F3> :!make<cr>
map <M-Enter> :VsTerm<cr>

map <C-n> :CtrlPTag<cr>
map <F6> :TagbarToggle<cr>
let g:tagbar_autoclose = 0

" map <C-[> :pop<cr>zz

set wmh=0
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l
map - <C-W>-
map + <C-W>+
map <M-<> 20<C-W><
map <M->> 20<C-W>>

let mapleader="\<Space>"

let g:completer_python_binary = "/usr/bin/python3"

let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_seed_identifiers_with_syntax = 0

nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_by_filename = 1
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_max_files = 0

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

" easyalign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-A> :ZoomToggle<CR>

" 
" " jedi-vim with YCM
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_use_ultisnips_completer = 1
" let g:ycm_seed_identifiers_with_syntax = 1
" 
" let g:jedi#auto_initialization = 1
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#smart_auto_mappings = 0
" let g:jedi#popup_on_dot = 0
" let g:jedi#completions_command = ""
" let g:jedi#show_call_signatures = "1"
" let g:jedi#show_call_signatures_delay = 0
" 
" auto-save
let g:auto_save = 1
let g:auto_save_no_updatetime = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

" validator
let g:validator_permament_sign = 1
let g:validator_debug = 1

" completor
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"


" camel case
" call camelcasemotion#CreateMotionMappings('<leader>')
" 
" " highlighting
" let g:cpp_class_scope_highlight = 1
" 
" " lh-cpp
" let g:ycm_key_invoke_completion = '<C-b>'
"
"

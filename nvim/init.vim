" plugins
call plug#begin('~/.local/share/nvim/plugged')

" completion
" Plug 'roxma/nvim-completion-manager'
" Plug 'vim-syntastic/syntastic'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-clang', { 'do': ':UpdateRemotePlugins' }

" rust
"Plug 'phildawes/racer'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
"Plug 'roxma/nvim-cm-racer'

" d
Plug 'landaire/deoplete-d'

" c/c++
Plug 'roxma/clang_complete'

" python
Plug 'zchee/deoplete-jedi'

" linting
"Plug 'w0rp/ale'
" Plug 'neomake/neomake'
" Plug 'dojoteef/neomake-autolint'

" auto brackets
Plug 'jiangmiao/auto-pairs'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'
Plug 'craigemery/vim-autotag'

" autosave
Plug '907th/vim-auto-save'

" themes
Plug 'NLKNguyen/papercolor-theme'

" syntax
Plug 'NLKNguyen/c-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'hdima/python-syntax'

" git
Plug 'airblade/vim-gitgutter'

" tagbar
Plug 'majutsushi/tagbar'

" easymotion
Plug 'easymotion/vim-easymotion'

" aligning
Plug 'junegunn/vim-easy-align'

call plug#end()


" line numbers
set number
set relativenumber

" search
set hlsearch
set incsearch

" split sides
set splitright
set splitbelow

" statusbar
set ruler
set laststatus=2
set showcmd
set showmode

" tabs
set tabstop=4    " visible
set noexpandtab  " keep tabs
set shiftwidth=4 " << >>
set softtabstop=4

" colours
syntax on
colo PaperColor
set background=dark

" mappings
" leader
let mapleader = "\<Space>"

" esc
ino jk <esc>

" reload
command! R source $MYVIMRC

" remove search highlighting
map <F2> :noh<cr>

" vim-racer
set hidden
let g:racer_cmd = "/home/dom/.cargo/bin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" rusty-tags
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWrite *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&"
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi

" deoplete
let g:deoplete#sources#d#dcd_server_autostart = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#rust#racer_binary = '/home/dom/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path = '/home/dom/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

" CtrlP
map <C-n> :CtrlPTag<cr>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_by_filename = 1
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_max_files = 0

" tagbar
map <F6> :TagbarToggle<cr>
let g:tagbar_autoclose = 0
let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \]
    \}

" buffers
set wmh=0
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map - <C-W>-
map + <C-W>+
map <M-<> 20<C-W><
map <M->> 20<C-W>>

" easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0
map <Leader>f <Plug>(easymotion-bd-w)
map <Leader>l <Plug>(easymotion-bd-jk)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" easyalign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" maximize window
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
nnoremap <silent> <C-a> :ZoomToggle<cr>

" auto save
let g:auto_save = 1
let g:auto_save_silent = 1

" no auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" completion
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" persistent undo
set undodir=$XDG_CONFIG_HOME/nvim/undodir
set undofile

" filetypes
filetype plugin on

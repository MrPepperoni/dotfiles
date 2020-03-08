if has('python3')
endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'vim-syntastic/syntastic'
Plug 'uu59/vim-herokudoc-theme', { 'as': 'herokudoc' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'aperezdc/vim-template'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'craigemery/vim-autotag'
call plug#end()
":PlugInstall

syntax on
filetype plugin indent on
set nocompatible
set hidden
set wildmenu
set showcmd
set hlsearch
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
set mouse=a
set cmdheight=2
set number
set shiftwidth=4
set softtabstop=4
set expandtab
" colorscheme molokai
colorscheme herokudoc
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE

"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ctrlp_regexp = 1
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|o|a)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
set wildignore=""
set backspace=2

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

set list
set listchars=tab:\ \ ,trail:\ 
hi SpecialKey ctermbg=red guibg=red

let g:templates_no_autocmd = 1
let g:ycm_server_python_interpreter = '/usr/bin/python'

let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['python'] }


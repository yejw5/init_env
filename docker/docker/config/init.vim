set nocompatible

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

call plug#begin('~/.vim/plugged')
  Plug 'vim-airline/vim-airline'
  Plug 'scrooloose/nerdtree'
  Plug 'vim-syntastic/syntastic'

  " Add maktaba and codefmt to the runtimepath.
  " (The latter must be installed before it can be used.)
  Plug 'google/vim-maktaba'
  Plug 'google/vim-codefmt'
  " Also add Glaive, which is used to configure codefmt's maktaba flags. See
  " `:help :Glaive` for usage.
  Plug 'google/vim-glaive'

  " A rudimentary Bazel filetype plugin
  Plug 'bazelbuild/vim-ft-bzl'

  Plug 'rhysd/vim-clang-format'

  Plug 'github/copilot.vim'

call plug#end()

" deoplete
" let g:deoplete#enable_at_startup = 1

" nerd tree
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

" pathogen
" execute pathogen#infect()
syntax on
filetype plugin indent on

set nu
set ruler
set tabstop=2 shiftwidth=2 expandtab
set colorcolumn=80

syntax enable
set background=dark

hi Pmenu ctermfg=black ctermbg=White

" air-line
set laststatus=2

set incsearch   " Incremental search
set hlsearch     " highlight search
set ic            " ignore case
set smartcase
set cursorline

map <c-]> g<c-]>

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

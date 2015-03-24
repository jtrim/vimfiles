set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-dispatch'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'edsono/vim-matchit'
Plugin 'tpope/vim-haml'
Plugin 'slim-template/vim-slim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elixir-lang/vim-elixir'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'wesgibbs/vim-irblack'
Plugin 'vim-scripts/ZoomWin'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" --- END INIT ---

let mapleader = ","
set shell=/usr/local/bin/zsh
set wildignore+=*/docs/javascripts/*,*/public/assets/source_maps/*,*/public/source_maps/*,*/tmp/*,*.so,*.swp,*.zip

set t_Co=256 " 256 colors
syntax enable
set background=dark

colorscheme ir_black
" hi Visual guifg=NONE guibg=#262D51 gui=NONE ctermfg=NONE ctermbg=yellow cterm=NONE

set nocompatible " Turn off vi compatibility
set modelines=0
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set colorcolumn=""

" Make vim's regex behave nicely
nnoremap / /\v
vnoremap / /\v

" Search modifications
set incsearch
set showmatch
set hlsearch

set ignorecase

" All lowercase string: case-insensitive searching.
" Mix-case string: case-sensitive searching.
set smartcase

" Unhighlight with ,<Space>
nnoremap <leader><space> :noh<cr>

set nowrap
set textwidth=79

" see :help formatoptions for more settings.
" Controls autoformatting of text.
set formatoptions=qrn1

" Change where vim saves backup files
set backupdir=./.backup,~/.backup,.,/tmp

" Change where vim saves .swp files
set directory=./.swap,~/.swap,.,/tmp

" Whitespace behavior
" ===================

set previewheight=20
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Marker characters
" =================

set list
set listchars=tab:➜\ ,trail:･

" Strip whitespace and save
nnoremap <leader>ww :%s/\s\+$//<cr>:let @/=''<CR>:w<cr>

" Make jj escape
inoremap jj <ESC>

" Make window larger or smaller by 17 columns at a time
map <C-l> <C-w>17>
map <C-s> <C-W>17<

" (Mac OS only): open the root of a project in Finder
map <Leader>op :!open .<CR><CR>

map <C-k> :tabn<cr>
map <C-j> :tabp<cr>
map <C-n> :tabnew<cr>

set clipboard=unnamed

" quickfix
" map <leader>cc :cclose<cr>


" --- PLUGINS ---

" =======
" NERDTree
" =======

nnoremap <leader>n :NERDTreeToggle<cr>
let g:NERDTreeDirArrows = 1

" ============
" NERDCommenter
" ============

let g:NERDCreateDefaultMappings = 0
let g:NERDCustomDelimiters = {
 \ 'ruby': { 'left': '# ' },
 \ 'vim': { 'left': '" ' },
 \ 'haskell': { 'left': '-- ', 'right': '' },
 \ 'slim': { 'left': '/ ', 'right': '' },
 \ 'scss': { 'left': '// ', 'right': '' },
 \ 'javascript': { 'left': '// ', 'right': '' }
 \ }

" =====
" CtrlP
" =====

map <leader>tt :CtrlP<CR>
map <leader>tv :CtrlP app/views<CR>
map <leader>tm :CtrlP app/models<CR>
map <leader>tc :CtrlP app/controllers<CR>
map <leader>ts :CtrlP spec<CR>

map <leader>ta :CtrlPTag<CR>

" ===
" Ack
" ===

nnoremap <leader>aa :Ack<space>

" =====
" Rspec
" =====

let g:rspec_command = "Dispatch bundle exec rspec --format=progress {spec}"
map <Leader>rf :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

" =====
" Rails
" =====

map <Leader>R :vs<CR><C-W>l:A<CR>

" ======================
" General Customizations
" ======================

" nunmap <Leader>cc
" xunmap <Leader>cc
" nnoremap <Leader>cc :cclose<cr>

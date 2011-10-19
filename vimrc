" Disclaimer: there's a good chance a lot of this config came from
" this blog post: http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" Lots of good stuff in there, please have a look and enjoy.

let mapleader = ","
call pathogen#infect()

" General vim behavior modification therapy
" =========================================

syntax on
filetype plugin indent on
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
set relativenumber
set undofile

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

" <tab> will match brackets
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79

" see :help formatoptions for more settings.
" Controls autoformatting of text.
set formatoptions=qrn1

set colorcolumn=85
hi ColorColumn ctermbg=lightgrey guibg=lightgrey

" Save buffer when focus lost
au FocusLost * :wa

" Whitespace behavior
" ===================

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Marker characters
" =================

set list
set listchars=tab:➜\ ,eol:¬,trail:･

" Various syntax fixes for filenames
" ==================================

au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile .autotest setf ruby
au BufNewFile,BufRead *.rhtml set syn=eruby
au BufNewFile,BufRead *.erb set syn=eruby
au BufNewFile,BufRead *.erubis set syn=eruby

" Folds
" =====

au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" Leader-based customizations
" ===========================

" Strip whitespace and save
nnoremap <leader>ww :%s/\s\+$//<cr>:let @/=''<CR>:w<cr>

" Manually re-wrap paragraphs
nnoremap <leader>q gqip

" Reselect newly-pasted text
nnoremap <leader>v V`]

" Quick editing of vimrc
nnoremap <leader>ev :vsp<cr><C-w>l:Ve vimrc<cr>

" Make jj escape
inoremap jj <ESC>

" Make window larger or smaller by 17 columns at a time
map <C-l> <C-w>17>
map <C-s> <C-W>17<

" (Mac OS only): open the root of a project in Finder
map <Leader>op :!open .<CR><CR>

" Replace tabs with spaces
nnoremap <silent> <leader>ts :let _s=@/<Bar>:%s/	/  /g<Bar>:let @/=_s<Bar>:nohl<CR>

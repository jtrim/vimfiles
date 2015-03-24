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
Plugin 'gabesoft/vim-ags'
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

" (Mac OS only): open the root of a project in Finder
map <Leader>op :!open .<CR><CR>

map <BS> :tabp<cr>
map <Space> :tabn<cr>
nnoremap <C-n> :tabnew<cr>

set clipboard=unnamed

" quickfix
map <leader>cc :cclose<cr>

" scratchpad
map <leader>s :e ./scratchpad<cr>
map <leader>q :cfile ./scratchpad<cr> :copen<cr>

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

xmap <Leader>c<Space> <plug>NERDCommenterToggle
nmap <Leader>c<Space> <plug>NERDCommenterToggle

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
" Ags
" ===

nnoremap <leader>aa :Ags<space>
let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore vendor/bundle -g ""'
let g:ctrlp_use_caching = 0
let g:ags_agargs = {
  \ '--break'             : [ '', '' ],
  \ '--color'             : [ '', '' ],
  \ '--color-line-number' : [ '"1;30"', '' ],
  \ '--color-match'       : [ '"32;40"', '' ],
  \ '--color-path'        : [ '"1;31"', '' ],
  \ '--column'            : [ '', '' ],
  \ '--context'           : [ 'g:ags_agcontext', '-C', '3' ],
  \ '--group'             : [ '', '' ],
  \ '--heading'           : [ '', '-H' ],
  \ '--max-count'         : [ 'g:ags_agmaxcount', '-m', '2000' ],
  \ }

" =====
" Rspec / Dispatch
" =====

let g:dispatch_compilers = { 'bundle exec': '' }
let g:rspec_command = "Dispatch bundle exec rspec --format=progress {spec}"
map <Leader>rf :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

" =====
" Rails
" =====

map <Leader>R :vs<CR><C-W>l:A<CR>

" =====
" ZoomWin
" =====

map <Leader><Leader> :ZoomWin<CR>

" ==================================
" Various syntax fixes for filenames
" ==================================
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile .autotest setf ruby
au BufRead,BufNewFile Rakefile setf ruby
au BufRead,BufNewFile Guardfile setf ruby
au BufRead,BufNewFile Gemfile setf ruby
au BufNewFile,BufRead *.rhtml set syn=eruby
au BufNewFile,BufRead *.erb set syn=eruby
au BufNewFile,BufRead *.erubis set syn=eruby
au BufNewFile,BufRead *.slim set syn=slim
au BufNewFile,BufRead *.clj set syn=clojure
au BufNewFile,BufRead *.json setf javascript
au BufNewFile,BufRead *.cabal setf haskell

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

au BufWritePost config/routes.rb silent !routes 2>&1 > /dev/null &

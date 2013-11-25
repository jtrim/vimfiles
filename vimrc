" Disclaimer: there's a good chance a lot of this config came from
" this blog post: http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" Lots of good stuff in there, please have a look and enjoy.

let mapleader = ","

" NERDCommenter custom delimteres
" Needs to be set before the plugin
" is loaded
let g:NERDCustomDelimiters = {
  \ 'ruby': { 'left': '# ' },
  \ 'vim': { 'left': '" ' },
  \ 'haskell': { 'left': '{- ', 'right': ' -}' },
  \ 'slim': { 'left': '/ ', 'right': '' }
  \ }

let g:solarized_termcolors=256
let g:solarized_termtrans=1
set t_Co=256

call pathogen#infect()

syntax enable
set background=dark
colorscheme ir_black

highlight LineNr ctermfg=52 ctermbg=234

" General vim behavior modification therapy
" =========================================

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
set colorcolumn=""
" Disable this until figuring out how
" to relocate the undo files
" set undofile

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

set nowrap
set textwidth=79

" see :help formatoptions for more settings.
" Controls autoformatting of text.
set formatoptions=qrn1

" Save buffer when focus lost
au FocusLost * :wa

" Change where vim saves backup files
set backupdir=./.backup,~/.backup,.,/tmp

" Change where vim saves .swp files
set directory=./.swap,~/.swap,.,/tmp

" Whitespace behavior
" ===================

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Marker characters
" =================

set list
set listchars=tab:➜\ ,trail:･

" Various syntax fixes for filenames
" ==================================

au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile .autotest setf ruby
au BufRead,BufNewFile Rakefile setf ruby
au BufRead,BufNewFile Guardfile setf ruby
au BufNewFile,BufRead *.rhtml set syn=eruby
au BufNewFile,BufRead *.erb set syn=eruby
au BufNewFile,BufRead *.erubis set syn=eruby
au BufNewFile,BufRead *.slim set syn=slim
au BufNewFile,BufRead *.clj set syn=clojure
au BufNewFile,BufRead *.json setf javascript

" Views
" =====
" Interesting because Views are used to store
" lots of data, including fold information
" (which is what I'm interested in)

" JT 1/2/12: Commented out because it breaks rails.vim
" see http://blog.gabebw.com/2010/08/03/rails-vim-and-those-pesky-e345-cant-find-file-xxx-in-path-errors/
" au BufWinLeave * silent! mkview
" au BufWinEnter * silent! loadview

" Plugin customizations
" =====================

" NERDTree directory arrows ( janus-style )
let g:NERDTreeDirArrows = 1

" CommandT max height on summon
let g:CommandTMaxHeight=20
map <leader>tt :CtrlP<CR>
set ttimeoutlen=50

map <leader>rr :w ! ruby<CR>

let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']

" Leader-based customizations
" ===========================

" Toggle nerdtree
nnoremap <leader>n :NERDTreeToggle<cr>

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
nnoremap <silent> <leader>wt :let _s=@/<Bar>:%s/	/  /g<Bar>:let @/=_s<Bar>:nohl<CR>

" Open Ack.vim
nnoremap <leader>aa :Ack<space>

" Toggle Zoomwin
nnoremap <leader><leader> :ZoomWin<cr>

map <C-k> :tabn<cr>
map <C-j> :tabp<cr>
map <C-n> :tabnew<cr>

set clipboard=unnamed

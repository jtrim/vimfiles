set nocompatible

" ==================================
" Various syntax fixes for filenames
" ==================================

au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile .autotest setf ruby
au BufRead,BufNewFile Rakefile setf ruby
au BufRead,BufNewFile Guardfile setf ruby
au BufRead,BufNewFile Gemfile setf ruby
au BufRead,BufNewFile Procfile setf yaml
au BufNewFile,BufRead *.rabl setf ruby
au BufNewFile,BufRead *.rhtml set syn=eruby
au BufNewFile,BufRead *.erb set syn=eruby
au BufNewFile,BufRead *.erubis set syn=eruby
au BufNewFile,BufRead *.slim set syn=slim
au BufNewFile,BufRead *.clj set syn=clojure
au BufNewFile,BufRead *.json setf javascript
au BufNewFile,BufRead *.cabal setf haskell
au BufNewFile,BufRead *.coffee setf coffee
au BufNewFile,BufRead *.swift setf swift
syntax enable

filetype plugin indent on

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/compiler
call vundle#begin()

Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-fireplace'

Plugin 'gmarik/Vundle.vim'
Plugin 'wesgibbs/vim-irblack'

Plugin 'edsono/vim-matchit'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-dispatch'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-scripts/saturn.vim'
Plugin 'keith/swift.vim'
Plugin 'vim-scripts/Align'
Plugin 'junegunn/goyo.vim'

" All of your Plugins must be added before the following line
call vundle#end()

" --- END INIT ---

let mapleader = ","
set shell=/usr/local/bin/zsh
set wildignore+=*/docs/javascripts/*,*/public/assets/source_maps/*,*/public/source_maps/*,*/tmp/*,*.so,*.swp,*.zip

" Colors
set t_Co=256
colorscheme saturn

" Vim Configs
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
set number
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

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

" (Mac OS only): open the root of a project in Finder
map <Leader>op :!open .<CR><CR>

" Tabs
map <BS> :tabp<cr>
map <Space> :tabn<cr>
nnoremap <C-n> :tabnew<cr>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

set clipboard=unnamed

" quickfix
map <leader>cc :cclose<cr>

" scratchpad
map <leader>s :e ./scratchpad<cr>
map <leader>q :cfile ./scratchpad<cr> :copen<cr>

" misc mappings

" <minus> edits the current dir
nnoremap - :e %:h<cr>

" Make jj escape
inoremap jj <ESC>

" Select recently pasted (/changed) data
nnoremap gp `[v`]

" --- PLUGINS ---

" =======
" NERDTree
" =======

nnoremap <leader>n :NERDTreeToggle<cr>
nmap <Leader>ff :NERDTreeFind<CR>
let g:NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 50

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

let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore vendor/bundle -g ""'
let g:ctrlp_use_caching = 0

map <leader>ta :CtrlPTag<CR>

" ===
" Ag
" ===

nnoremap <leader>aa :Ag<space>

" =====
" Rspec / Dispatch
" =====

let g:dispatch_compilers = { 'bundle exec': '' }
map <Leader>d :Dispatch<CR>

let g:rspec_command = "Dispatch bundle exec rspec --format=progress {spec}"
map <Leader>rf :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

function! g:FocusAndDispatchTestLine()
  execute "Focus bundle exec test-unit-runner %:" . line(".") . " -p"
  execute "Dispatch"
endfunction

function! g:FocusAndDispatchTestFile()
  execute "Focus bundle exec test-unit-runner % -p"
  execute "Dispatch"
endfunction

map <Leader>us :call g:FocusAndDispatchTestLine()<CR>
map <Leader>uf :call g:FocusAndDispatchTestFile()<CR>

" =====
" Rails
" =====

map <Leader>R :vs<CR><C-W>l:A<CR>

" ===================
" Goyo
" ===================

function! s:goyo_enter()
  setlocal wrap linebreak nolist
  set virtualedit=
  setlocal display+=lastline
  noremap  <buffer> <silent> k gk
  noremap  <buffer> <silent> j gj
  noremap  <buffer> <silent> 0 g0
  noremap  <buffer> <silent> $ g$
  if exists('$TMUX')
    silent !tmux set status off
  endif
endfunction

function! s:goyo_leave()
  setlocal nowrap
  set virtualedit=all
  silent! nunmap <buffer> k
  silent! nunmap <buffer> j
  silent! nunmap <buffer> 0
  silent! nunmap <buffer> $
  if exists('$TMUX')
    silent !tmux set status on
  endif
endfunction

autocmd User GoyoEnter nested call <SID>goyo_enter()
autocmd User GoyoLeave nested call <SID>goyo_leave()

" ======
" Routes
" ======

au BufWritePost config/routes.rb silent !routes 2>&1 > /dev/null &

function g:LoadRoutes() abort
  badd routes
  buffer routes
  read !routes
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
endfunction

command! -nargs=* -complete=shellcmd Routes new | jk:q

map <Leader>lr :new<cr> :call g:LoadRoutes()<cr>
map <Leader>tlr :tabnew<cr> :call g:LoadRoutes()<cr>

" ======
" Markdown
" ======

function! g:RenderMarkdown(template_path)
  let rubyscript = '
        \ require "rubygems";
        \ require "kramdown";
        \ require "erb";
        \ body = Kramdown::Document.new(STDIN.read.chomp, input: "GFM", hard_wrap: false).to_html;
        \ print ERB.new(File.read("' . a:template_path . '/.vim/support/kramdown.html.erb")).result(binding)'

  execute "w !ruby -e '" . rubyscript . "' > /tmp/mdresult.html; open /tmp/mdresult.html"
endfunction

map <silent> <Leader>md :call g:RenderMarkdown($HOME)<CR>


" ======
" JSON
" ======

" Reformat the current buffer by piping its contents through the `jq' command
" line utility
command! Json %!jq .

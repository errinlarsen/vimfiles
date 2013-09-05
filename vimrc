set nocompatible               " be iMproved

" ---------------------------------------------------------------------------
"  Plugins
" ---------------------------------------------------------------------------

silent! runtime bundles.vim

" ---------------------------------------------------------------------------
"  General
" ---------------------------------------------------------------------------

filetype plugin indent on
let mapleader = ","
let g:mapleader = ","
set modelines=0
set history=1000
set nobackup
set nowritebackup
set noswapfile
syntax enable
set autoread

" ---------------------------------------------------------------------------
"  UI
" ---------------------------------------------------------------------------

set title
set encoding=utf-8
set scrolloff=3
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell

" highlight the current line
set cursorline
" Highlight active column
set cursorcolumn

set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set undofile

" Auto adjust window sizes when they become current
" set winwidth=84
" set winheight=5
" set winminheight=5
" set winheight=999

" ---------------------------------------------------------------------------
"  Color scheme
" ---------------------------------------------------------------------------
set t_Co=256
set background=dark " light is default
let base16colorspace=256
colorscheme base16-railscasts
" colorscheme railscasts-term

set splitbelow splitright

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set nowrap
set textwidth=79
set formatoptions=n

" check to make sure vim has been compiled with colorcolumn support
" before enabling it
if exists("+colorcolumn")
  set colorcolumn=80
endif

" ---------------------------------------------------------------------------
"  Mappings
" ---------------------------------------------------------------------------
" Searching / moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
" turn search highlight off
nnoremap <leader><space> :noh<cr>
" search (forwards)
nmap <space> /
" search (backwards)
map <c-space> ?

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz

imap <C-h> <ESC>^
imap <C-l> <ESC>$

" Turn off arrow keys (this might not be a good idea for beginners, but it is
" the best way to ween yourself of arrow keys on to hjkl)
" http://yehudakatz.com/2010/07/29/
" \ everyone-who-tried-to-convince-me-to-use-vim-was-wrong/
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>"
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Change up/down
nnoremap j gj
nnoremap k gk

" Map ESC
imap jj <ESC>

" ACK
" set grepprg=ack
" ,a to Ack (search in files)
nnoremap <leader>a :Ack

" Ack settings: https://github.com/krisleech/vimfiles/wiki/Make-ack-ignore-files

" Auto format
map === mmgg=G`m^zz

" Move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move lines up and down
" map <C-J> :m +1 <CR>
" map <C-K> :m -2 <CR>


" Switch between last two buffers
nnoremap <leader><leader> <c-^>

" Edit/View files relative to current directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" Ignore some binary, versioning and backup files when auto-completing
set wildignore=.svn,CVS,.git,*.swp,*.jpg,*.png,*.gif,*.pdf,*.bak
" Set a lower priority for .old files
set suffixes+=.old

" Saving and exit
" nmap <leader>q :wqa!<CR>
" nmap <leader>w :w!<CR>
" nmap <leader><Esc> :q!<CR>

" ---------------------------------------------------------------------------
"  Function Keys
" ---------------------------------------------------------------------------
" F2 - Terminal
" map <F2> :ConqueTerm zsh<CR>

" F3 - YankRing
" nnoremap <silent> <F3> :YRShow<cr>
" inoremap <silent> <F3> <ESC>:YRShow<cr>

" Press F5 to toggle GUndo tree
nnoremap <F5> :GundoToggle<CR>

" indent file and return cursor and center cursor
map   <silent> <F6> mmgg=G'mzz
imap  <silent> <F6> <Esc> mmgg=G'mzz


"  ===========================================================================
"  Plugins
"  ===========================================================================

" ---------------------------------------------------------------------------
" Command-T
" ---------------------------------------------------------------------------
" find file
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
" find file in current directory
map <leader>gf :CommandTFlush<cr>\|:CommandT %%<cr>

let g:CommandTMaxHeight = 20

" ---------------------------------------------------------------------------
" NERDTree
" ---------------------------------------------------------------------------
let NERDTreeShowBookmarks = 0
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
let NERDTreeHijackNetrw = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize = 50
let NERDTreeChDirMode = 2
let NERDTreeDirArrows = 1
" open file browser
map <leader>p :NERDTreeToggle<cr>

" ---------------------------------------------------------------------------
" MiniBufExpl
" ---------------------------------------------------------------------------
" let g:miniBufExplBRSplit = 0
let g:miniBufExplBuffersNeeded = 1
" Focus into the MBE window
noremap <leader>b :MBEFocus<cr>
" Switch between buffers
noremap <tab> :MBEbn<cr>
noremap <S-tab> :MBEbp<cr>
" close buffer
noremap <leader>d :MBEbd<cr>
" close all buffers
" nmap <leader>da :bufdo bd<CR>
" unload buffer
noremap <leader>u :MBEbun<cr>
" wipeout buffer
noremap <leader>D :MBEbw<cr>

" ---------------------------------------------------------------------------
" TagList
" ---------------------------------------------------------------------------
set tags=./tags;
" Support for https://github.com/ivalkeen/guard-ctags-bundler
set tags+=gems.tags
map <leader>l :TlistToggle <cr>
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 60
" Generate ctags for all bundled gems as well
" map <leader>rt :!ctags --extra=+f --languages=-javascript --exclude=.git --exclude=log -R * `rvm gemdir`/gems/* `rvm gemdir`/bundler/gems/*<CR><C-M>
" Use only current file to autocomplete from tags
" set complete=.,t
set complete=.,w,b,u,t,i

" ---------------------------------------------------------------------------
" AutoClose
" ---------------------------------------------------------------------------
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

" ---------------------------------------------------------------------------
" Tabularize
" ---------------------------------------------------------------------------
if exists(":Tab")
  nmap <leader>a\| :Tab /\|<CR>
  vmap <leader>a\| :Tab /\|<CR>
  nmap <leader>a= :Tab /=<CR>
  vmap <leader>a= :Tab /=<CR>
  nmap <leader>a: :Tab /:\zs<CR>
  vmap <leader>a: :Tab /:\zs<CR>
endif

" Easy commenting
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" ---------------------------------------------------------------------------
"  Syntastic
" ---------------------------------------------------------------------------
" let g:syntastic_auto_loc_list=1
" let g:syntastic_auto_jump=1

" ---------------------------------------------------------------------------
"  Ruby/Rails
" ---------------------------------------------------------------------------
" Execute current buffer as ruby
map <leader>r :w !ruby<CR>

map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets<cr>
map <leader>ga :CommandTFlush<cr>\|:CommandT app/assets<cr>

" View routes or Gemfile in large split
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

" Skip to Model, View or Controller
map <leader>m :Rmodel
map <leader>v :Rview
map <leader>c :Rcontroller

" Other files to consider Ruby
au BufRead,BufNewFile Gemfile,Rakefile,Thorfile,config.ru,Vagrantfile,Guardfile,Capfile set ft=ruby

" ---------------------------------------------------------------------------
"  CoffeeScript
" ---------------------------------------------------------------------------
let coffee_compile_vert = 1
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent

" ---------------------------------------------------------------------------
"  SASS / SCSS
" ---------------------------------------------------------------------------
au BufNewFile,BufReadPost *.scss setl foldmethod=indent
au BufNewFile,BufReadPost *.sass setl foldmethod=indent
au BufRead,BufNewFile *.scss set filetype=scss

" ---------------------------------------------------------------------------
" GUI
" ---------------------------------------------------------------------------
if has("gui_running")
  set guioptions-=T " no toolbar set guioptions-=m " no menus
  set guioptions-=r " no scrollbar on the right
  set guioptions-=R " no scrollbar on the right
  set guioptions-=l " no scrollbar on the left
  set guioptions-=b " no scrollbar on the bottom
  set guioptions=aiA
  set mouse=v
  set guifont=Sauce\ Code\ Powerline\ Semibold:h13 "<- Maybe a good idea when using mac
endif
set guifont=Sauce\ Code\ Powerline\ Semibold:h13

" ---------------------------------------------------------------------------
"  Directories
" ---------------------------------------------------------------------------
set backupdir=~/tmp,/tmp
set undodir=~/.vim/.tmp,~/tmp,~/.tmp,/tmp

" Ctags path (brew install ctags)
let Tlist_Ctags_Cmd = 'ctags'

" ---------------------------------------------------------------------------
"  vim-airline
" ---------------------------------------------------------------------------
" Enable Powerline fonts
let g:airline_powerline_fonts = 1
" Change truncation widths
let g:airline#extensions#default#section_truncate_width
      \= {'b': 104, 'x': 60, 'y': 104, 'z': 45}

" ---------------------------------------------------------------------------
"  vim-gitgutter
" ---------------------------------------------------------------------------
" Ignore whitespace
let g:gitgutter_diff_args = '-w'

"  ---------------------------------------------------------------------------
"  Misc
"  ---------------------------------------------------------------------------

" Finally, load custom configs
if filereadable(expand("$HOME") . '.vimrc.local')
  source ~/.vimrc.local
endif

" When vimrc, either directly or via symlink, is edited, automatically reload it
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost vimrc source %

set nocompatible               " be iMproved

" ---------------------------------------------------------------------------
"  Plugins
" ---------------------------------------------------------------------------
silent! runtime bundles.vim

" ---------------------------------------------------------------------------
"  General
" ---------------------------------------------------------------------------
let s:home_dir = expand("$HOME/")

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

set splitbelow splitright

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set nowrap
set textwidth=79
set formatoptions=n

" ---------------------------------------------------------------------------
"  Color scheme
" ---------------------------------------------------------------------------
set t_Co=256
set background=dark " light is default
let base16colorspace=256
colorscheme base16-railscasts

" Cursor row/column colors:
hi CursorLine ctermbg=235
hi CursorColumn ctermbg=235

" check to make sure vim has been compiled with colorcolumn support
" before enabling it
if exists("+colorcolumn")
  set colorcolumn=81
endif

" ---------------------------------------------------------------------------
"  Mappings
" ---------------------------------------------------------------------------
" Searching / moving
" nnoremap / /\v
" vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
" turn current search highlight off
nnoremap <leader><space> :noh<cr>
" search (forwards)
" nmap <space> /
" search (backwards)
" map <c-space> ?

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz

" Turn off arrow keys (this might not be a good idea for beginners, but it is
" the best way to ween yourself of arrow keys on to hjkl)
" http://yehudakatz.com/2010/07/29/
" \ everyone-who-tried-to-convince-me-to-use-vim-was-wrong/
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
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
" nnoremap <leader>a :Ack
" Ack settings: https://github.com/krisleech/vimfiles/wiki/Make-ack-ignore-files


" Auto format
map === mmgg=G`m^zz

" Splits & Tabs
" Move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Create new tab
noremap <leader>t :tabnew<cr>
noremap <leader>T :tabedit %%
" Move between tabs
nnoremap t gt
nnoremap T gT

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
" nnoremap <F5> :GundoToggle<CR>

" indent file and return cursor and center cursor
map   <silent> <F6> mmgg=G'mzz
imap  <silent> <F6> <Esc> mmgg=G'mzz


"  ===========================================================================
"  Plugins
"  ===========================================================================

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
noremap <leader>p :NERDTreeToggle<cr>
" [˜ == <A-n>] find current file in file browser
noremap <C-p> :NERDTreeFind<cr>

" ---------------------------------------------------------------------------
" BufExplorer
" ---------------------------------------------------------------------------
let g:bufExplorerShowRelativePath = 1  " Show relative paths
let g:bufExplorerSplitRight = 0        " Split left
" " Switch between buffers
noremap <tab> :bn<cr>
noremap <S-tab> :bp<cr>
" close buffer
noremap <leader>bd :bd<cr>
" " close all buffers
" " nmap <leader>da :bufdo bd<CR>
" unload buffer
noremap <leader>bu :bun<cr>
" wipeout buffer
noremap <leader>bw :bw<cr>

" ---------------------------------------------------------------------------
" MiniBufExpl
" ---------------------------------------------------------------------------
" let g:miniBufExplorerAutoStart = 0  " Don't open at start
" let g:miniBufExplVSplit = 1         " Open in a Vertical Split
" let g:miniBufExplMinSize = 50       " Open to the top/left
" let g:miniBufExplBRSplit = 0        " Set the min width
" let g:miniBufExplBuffersNeeded = 0  " Show regardless of # of Buffers
" let g:miniBufExplCycleArround = 1   " Wrap when switching past last buffer
" let g:miniBufExplCloseOnSelect = 1  " Close after selectiong
"
" " Toggle the MBE windows
" nnoremap <F4> :MBEToggle<cr>
" " Toggle && Focus into the MBE window
" nnoremap <silent> <leader>b :call MBEOpenAndFocus()<cr>
" function! MBEOpenAndFocus()
"   :MBEToggle
"   if !matchstr(expand("%"), "MiniBufExplorer")
"     :MBEFocus
"   endif
"   set equalalways&
" endfunction
" " Switch between buffers
" " noremap <tab> :MBEbn<cr>
" " noremap <S-tab> :MBEbp<cr>
" noremap <tab> :MBEbn<cr>
" noremap <S-tab> :MBEbp<cr>
" " close buffer
" noremap <leader>d :MBEbd<cr>
" " close all buffers
" " nmap <leader>da :bufdo bd<CR>
" " unload buffer
" noremap <leader>u :MBEbun<cr>
" " wipeout buffer
" noremap <leader>D :MBEbw<cr>

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

" ---------------------------------------------------------------------------
"  TComment
" ---------------------------------------------------------------------------
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
map <leader>R :w !ruby<CR>

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
"  vim-vroom
" ---------------------------------------------------------------------------

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
"  GitGutter
" ---------------------------------------------------------------------------
let g:gitgutter_enabled = 0       " Turned off by default
let g:gitgutter_diff_args = '-w'  " Ignore whitespace
noremap <C-g><C-g> :GitGutterToggle<cr> <bar> :GitGutterLineHighlightsToggle<cr>

" Highlight line colors:
hi GitGutterAddLine        ctermfg=NONE ctermbg=238
hi GitGutterDiffChangeLine ctermfg=NONE ctermbg=238
hi GitGutterDiffDeleteLine ctermfg=NONE ctermbg=238

"  ---------------------------------------------------------------------------
"  Misc
"  ---------------------------------------------------------------------------

" Finally, load custom configs
if filereadable(s:home_dir . '.vimrc.local')
  source ~/.vimrc.local
endif

" When vimrc, either directly or via symlink, is edited, automatically reload it
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost vimrc source %

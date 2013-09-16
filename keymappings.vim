" ===========================================================================
"  Mappings
" ===========================================================================
let mapleader   = ","
let g:mapleader = ","

" " Map Quit
" nmap    <Leader><Esc>     :q!<CR>
" Map ESC
imap      jj                <ESC>
" When on the cmdline - '%%' expands to this buffer's path, relative to CWD
cnoremap  %%                <C-R>=expand('%:h').'/'<cr>

" ---------------------------------------------------------------------------
"  Movement
" ---------------------------------------------------------------------------
nnoremap  <Left>            :echoe "Use h"<CR>
nnoremap  <Right>           :echoe "Use l"<CR>
nnoremap  <Up>              :echoe "Use k"<CR>
nnoremap  <Down>            :echoe "Use j"<CR>
" Change up/down
nnoremap  j                 gj
nnoremap  k                 gk
" Turn off arrow keys
" http://yehudakatz.com/2010/07/29/everyone-who-tried-to-convince-me-to-use-vim-was-wrong/
inoremap  <up>              <nop>
inoremap  <down>            <nop>
inoremap  <left>            <nop>
inoremap  <right>           <nop>
" Move between splits
nnoremap  <C-h>             <C-w>h
nnoremap  <C-j>             <C-w>j
nnoremap  <C-k>             <C-w>k
nnoremap  <C-l>             <C-w>l
" Move between tabs
nnoremap  <Bslash>          gt
nnoremap  <Bar>             gT
" Center screen when scrolling search results
nmap      n                 nzz
nmap      N                 Nzz

" ---------------------------------------------------------------------------
"  Splits/Tabs
" ---------------------------------------------------------------------------
" Cycle through buffers
noremap   <tab>             :bn<cr>
noremap   <S-tab>           :bp<cr>
" Switch between last two buffers
nnoremap  <Leader><Leader>  <c-^>
" Close buffer
noremap   <Leader>bd        :bd<cr>
" " Close all buffers
" nmap    <Leader>da        :bufdo bd<CR>
" Unload buffer
noremap   <Leader>bu        :bun<cr>
" Wipeout buffer
noremap   <Leader>bw        :bw<cr>
" Create new tab
map       <Esc>t            :tabnew<cr>
map       <Esc>T            :tabedit %%

" ---------------------------------------------------------------------------
"  Files
" ---------------------------------------------------------------------------
" Edit/View files relative to current directory
map       <Leader>e         :edit %%
map       <Leader>v         :view %%
" open file browser
noremap   <Leader>p         :NERDTreeToggle<cr>
" find current file in file browser
noremap   <C-p>             :NERDTreeFind<cr>
" View routes or Gemfile in large split
map       <Leader>gr        :topleft :split config/routes.rb<cr>
map       <Leader>gg        :topleft 100 :split Gemfile<cr>
" Skip to Model, View or Controller
map       <Leader>m         :Rmodel
map       <Leader>v         :Rview
map       <Leader>c         :Rcontroller

" " Saving
" nmap    <Leader>w         :w!<CR>
" nmap    <Leader>q         :wqa!<CR>

" ---------------------------------------------------------------------------
"  Syntax stuff
" ---------------------------------------------------------------------------
" indent file and return cursor and center cursor
map       <silent> <F6>     mmgg=G'mzz
imap      <silent> <F6>     <Esc> mmgg=G'mzz
" Auto format
map       ===               mmgg=G`m^zz
" Tabularize - not working right now
if exists(":Tab")
  nmap      <Leader>a\|       :Tab /\|<CR>
  vmap      <Leader>a\|       :Tab /\|<CR>
  nmap      <Leader>a=        :Tab /=<CR>
  vmap      <Leader>a=        :Tab /=<CR>
  nmap      <Leader>a:        :Tab /:\zs<CR>
  vmap      <Leader>a:        :Tab /:\zs<CR>
endif
" Easy commenting - TComment
nnoremap  //                :TComment<CR>
vnoremap  //                :TComment<CR>

" Support for https://github.com/ivalkeen/guard-ctags-bundler
map       <Leader>l         :TlistToggle <cr>
" " Generate ctags for all bundled gems as well
" map     <Leader>rt        :!ctags --extra=+f --languages=-javascript
"                           \ --exclude=.git --exclude=log -R *
"                           \ `rvm gemdir`/gems/*
"                           \ `rvm gemdir`/bundler/gems/*<CR><C-M>

" ---------------------------------------------------------------------------
"  Searches
" ---------------------------------------------------------------------------
" " search (forwards)
" nmap <space> /
" " search (backwards)
" map <c-space> ?
" turn current search highlight off
nnoremap  <Leader><Space>   :noh<CR>
" Remove trailing whitespace
nnoremap  <Leader>w         :%s/\s\+$//e<CR>
" Highlight Merge-conflicts
nnoremap  <Leader>mc        /<<<<<\\|=====\\|>>>>><CR>

" ---------------------------------------------------------------------------
"  Misc.
" ---------------------------------------------------------------------------
" Execute current buffer as ruby
noremap   <Leader>rb        :w !ruby<CR>
" vim-vroom
noremap   <Leader>t         :VroomRunTestFile<CR>
noremap   <Leader>T         :VroomRunNearestTest<CR>
" Support for https://github.com/ivalkeen/guard-ctags-bundler
map       <Leader>l         :TlistToggle <CR>
" Toggle GitGutter
noremap   <C-g><C-g>        :GitGutterToggle<CR> <Bar> :GitGutterLineHighlightsToggle<CR>

" ---------------------------------------------------------------------------
"  Left-overs
" ---------------------------------------------------------------------------
" " Move lines up and down
" map <C-J> :m +1 <CR>
" map <C-K> :m -2 <CR>

" " F2 - Terminal
" map <F2> :ConqueTerm zsh<CR>

" " F3 - YankRing
" nnoremap <silent> <F3> :YRShow<cr>
" inoremap <silent> <F3> <ESC>:YRShow<cr>

" " Press F5 to toggle GUndo tree
" nnoremap <F5> :GundoToggle<CR>

" " ACK settings: https://github.com/krisleech/vimfiles/wiki/Make-ack-ignore-files
" set grepprg=ack
" " ,a to Ack (search in files)
" nnoremap <Leader>a :Ack

" ---------------------------------------------------------------------------
" MiniBufExpl
" ---------------------------------------------------------------------------
" " Toggle the MBE windows
" nnoremap <F4> :MBEToggle<cr>
" " Toggle && Focus into the MBE window
" nnoremap <silent> <Leader>b :call MBEOpenAndFocus()<cr>
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
" noremap <Leader>d :MBEbd<cr>
" " close all buffers
" " nmap <Leader>da :bufdo bd<CR>
" " unload buffer
" noremap <Leader>u :MBEbun<cr>
" " wipeout buffer
" noremap <Leader>D :MBEbw<cr>

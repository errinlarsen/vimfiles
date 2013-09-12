set nocompatible               " be iMproved

if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif

filetype off                   " must be off before Vundle has run

set runtimepath+=~/.vim/bundle/vundle/

call vundle#rc()

" General utility
Bundle "gmarik/vundle"
Bundle "L9"
Bundle "textobj-user"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"

" UI enhancements
Bundle "chriskempson/base16-vim"
Bundle "bling/vim-airline"
" Bundle "guns/xterm-color-table.vim"  " Can be helpful when picking colors

" Specific utilities
Bundle "scrooloose/nerdtree"
Bundle "bufexplorer.zip"
Bundle "sjl/gundo.vim"
Bundle "godlygeek/tabular"
Bundle "tpope/vim-fugitive"
Bundle "airblade/vim-gitgutter"

" General Programming/Markup language helpers
Bundle "taglist.vim"
Bundle "scrooloose/syntastic"
Bundle "Townk/vim-autoclose"
Bundle "tpope/vim-surround"
Bundle "tomtom/tcomment_vim.git"
Bundle "zweifisch/pipe2eval"

" Specific Programming/Markup language helpers
Bundle "vim-ruby/vim-ruby"
Bundle "tpope/vim-rbenv"
Bundle "textobj-rubyblock"
Bundle "tpope/vim-rake"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-rails"
Bundle "skalnik/vim-vroom"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-haml"
Bundle "tpope/vim-bundler"
Bundle "elixir-lang/vim-elixir"
Bundle "pangloss/vim-javascript"
Bundle "jQuery"
Bundle "vim-coffee-script"
Bundle "cakebaker/scss-syntax.vim"

" API wrappers
Bundle "mattn/wabapi-vim"  "gist-vim requirement
Bundle "mattn/gist-vim"

" Below are plugins I'm not sure I use/want/need
" Bundle "ack.vim"
" Bundle "fholgado/minibufexpl.vim"
" Bundle "SuperTab"
" Bundle "panozzaj/vim-autocorrect"
" Bundle "sophacles/vim-bundle-sparkup"
" Bundle "greyblake/vim-preview"
" Bundle "garbas/vim-snipmate"
" Bundle "honza/vim-snippets"
" Bundle "YankRing.vim"

filetype plugin indent on     " and turn it back on!

runtime macros/matchit.vim

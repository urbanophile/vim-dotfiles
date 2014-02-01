set nocompatible
source $VIMRUNTIME/vimrc_example.vim

if has('win32') || has('win64')
  source $VIMRUNTIME/mswin.vim
  behave mswin
end

" mandatory setting for vundle
filetype off

" Bug in vundle that needs to be fixed
if has('win32') || has('win64')
  set rtp+=~/vimfiles/bundle/vundle/
  call vundle#rc('$HOME/vimfiles/bundle/')
else
  " Usual quickstart instructions
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
endif

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'rstacruz/sparkup', {'rtp': 'vim'}
Bundle 'scrooloose/nerdtree'
Bundle 'msanders/snipmate'
Bundle 'andviro/flake8-vim'

" Bundle 'jelera/vim-javascript-syntax'
Bundle 'scrooloose/syntastic'
" vim-scripts repos

" non-GitHub repos



set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  els
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

syntax on
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set hidden
set wildmenu
set showcmd
set backspace=indent,eol,start
set ruler
set laststatus=2
set confirm
set visualbell
set cmdheight=2
set number   
set t_Co=256
set background=dark
set lines=40
set columns=79

" tab/spacing setting for python to conform to PEP8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smarttab
set expandtab
set textwidth=79

" Gets rid of shitty backups
set nobackup
set nowritebackup

filetype indent on
filetype plugin indent on


" colorscheme darkblue
au BufNewFile,BufRead *.QScript set filetype=javascript

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


" Octave syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END

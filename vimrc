set nocompatible              " be iMproved, required
filetype off                  " required


" VUNDLE  - plugins
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()"


Plugin 'gmarik/Vundle.vim'  "vundle itself
Plugin 'tpope/vim-fugitive' "git wrapper
Plugin 'kien/ctrlp.vim'     "full path fuzzy finder
Plugin 'SirVer/ultisnips'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'

Plugin 'flazz/vim-colorschemes'
Plugin 'matchit.zip'
Plugin 'endwise.vim'
Plugin 'kchmck/vim-coffee-script'

Plugin 'godlygeek/tabular' "dependency for vim-markdown
Plugin 'plasticboy/vim-markdown' "markdown syntax

Plugin 'tpope/vim-rails' "set of rails helpers

" instant markdown preview requires few python modules
" pip install bottle markdown pygments
Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'flomotlik/vim-livereload'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" VUNDLE end

if has('autocmd')
    filetype plugin indent on
    "don't expand tabs if we're in a makefile
    autocmd BufRead,BufNewFile Makefile set ts=4 sw=4 noexpandtab
    "wrap lines in TeX
    autocmd BufRead,BufNewFile *.tex set tw=80
    "wrap lines in .txt files
    autocmd BufNewFile,BufRead *.txt set tw=78

    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    "autocmd VimEnter * NERDTree
    "autocmd VimEnter * wincmd p
    " ruby completion
    autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
    autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
    autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
    autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
endif

" syntax highlighting
syntax enable

colorscheme ir_black
let g:rehash256 = 1
set t_Co=256
set nocompatible        " Use Vim defaults (much better!)
set bs=2                " Allow backspacing over everything in insert mode
set ai                  " Always set auto-indenting on
"set backup             " Keep a backup file
"set viminfo='20,\"50    " read/write a .viminfo file -- limit to only 50
set history=50          " keep 50 lines of command history
set ts=4                " 4 space wide tabs
set sw=4
set softtabstop=4     "makes backspacing over spaced out tabs work real nice
set expandtab           "expand tabs to spaces
set ignorecase
"set background=dark     "awesome for terminals with crappy colors (putty!)
set tagstack            "lets you push and pop your jumps with ctrl+]
set pastetoggle=<F11>   "when you're pasting stuff this keeps it from getting
                        "all whacked out with indentation
set showmatch
set showmode
set smarttab
set nrformats-=octal
set ttimeout
set ttimeoutlen=50
set incsearch

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
 nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif


" Added to default to high security within Gentoo. Fixes bug #14088
set modelines=0
" autocompletion - disable dictionary based
set complete-=k


set number
set hlsearch
set ignorecase
set smartcase

set hidden " do not save history when leavy buffer

" Don't use Ex mode, use Q for formatting
map Q gq


" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif


"collapsing window splits
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_


map <F2> :NERDTreeToggle<CR>
map <silent> <F4> :Sexplore<CR>

" explorer
let g:explVertical=1	" Split vertically
let g:explSplitRight=1    " Put new window to the right of the explorer

"space bar folding
nnoremap  <silent>  <space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l')<cr>


"good tab completion - press <tab> to autocomplete if there's a character
"previously
function InsertTabWrapper()
      let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
          return "\<tab>"
      else
          return "\<c-p>"
      endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

"switching between tabs



:nmap Z :tabprev<CR>
:nmap X :tabnext<CR>


" Smart way to move btw. windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

" Leader
let mapleader = ","

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2
set ruler               " Show the cursor position all the time
set rulerformat=%30(%<%m%y%h%r%=%l,%c\ %P%)
set showcmd
set wildmode=longest:full
set wildmenu

set autoread " reads the file when it has been changed outside vim
set encoding=utf-8

" files related
set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

" Format the statusline
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


function! CurDir()
    let curdir = substitute(getcwd(), '/home/skrobul/', "~/", "g")
    return curdir
endfunction



" tab navigation like firefox
:nmap <C-S-tab> :tabprevious<CR>
:nmap <C-tab> :tabnext<CR>
:map <C-S-tab> :tabprevious<CR>
:map <C-tab> :tabnext<CR>
:imap <C-S-tab> <Esc>:tabprevious<CR>i
:imap <C-tab> <Esc>:tabnext<CR>i
:nmap <C-t> :tabnew<CR>
:imap <C-t> <Esc>:tabnew<CR>


" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <M-F12> :BufExplorer<CR>
nnoremap <F12> :bn<CR>
nnoremap <S-F12> :bp<CR>

" NERDTree settings
let g:NERDTreeHighlightCursorline=1
let g:NERDTreeQuitOnOpen=1


"supertab
let g:SuperTabDefaultCompletionType = "context"

"wyszukiwanie w menu
set completeopt=menuone,longest,preview
let g:SuperTabLongestHighlight=1

" map control-backspace to delete the previous word
:imap <C-BS> <C-W>


"
" Plugins config
"
" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" Ultisnip
"  NOTE: <f1> otherwise it overrides <tab> forever
let g:UltiSnipsExpandTrigger="<f1>"
let g:UltiSnipsJumpForwardTrigger="<f1>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:did_UltiSnips_vim_after = 1
"
" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


" python-vim-instant-markdown
python import sys; sys.path.append('/Library/Python/2.7/site-packages')


" keymaps to help with transition back to vim
" Find
map <C-f> /
" indend / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap <Tab> >
vnoremap <S-Tab> <
" comment / decomment & normal comment behavior
vmap <C-m> gc
" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}
" Text wrap simpler, then type the open tag or ',"
vmap <C-w> S
" Cut, Paste, Copy
vmap <C-x> d
vmap <C-v> p
vmap <C-c> y
" Undo, Redo (broken)
nnoremap <C-z>  :undo<CR>
inoremap <C-z>  <Esc>:undo<CR>
nnoremap <C-y>  :redo<CR>
inoremap <C-y>  <Esc>:redo<CR>
" Tabs
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
nnoremap <C-b>  :tabprevious<CR>
inoremap <C-b>  <Esc>:tabprevious<CR>i
nnoremap <C-n>  :tabnext<CR>
inoremap <C-n>  <Esc>:tabnext<CR>i
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>i
nnoremap <C-k>  :tabclose<CR>
inoremap <C-k>  <Esc>:tabclose<CR>i


set cursorline  "highlights current line

" make vundle compatible... (requires bash)"
set shell=/bin/bash


" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif"

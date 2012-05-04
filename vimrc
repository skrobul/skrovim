syntax on
colorscheme synic
set t_Co=256
set nocompatible        " Use Vim defaults (much better!)
set bs=2                " Allow backspacing over everything in insert mode
set ai                  " Always set auto-indenting on
"set backup             " Keep a backup file
"set viminfo='20,\"50    " read/write a .viminfo file -- limit to only 50
set history=50          " keep 50 lines of command history
set ruler               " Show the cursor position all the time
set wildmode=longest:full
set wildmenu
set rulerformat=%30(%<%m%y%h%r%=%l,%c\ %P%)
set ts=4                " 4 space wide tabs
set sw=4
set softtabstop=4     "makes backspacing over spaced out tabs work real nice
set expandtab           "expand tabs to spaces
set ignorecase
"set background=dark     "awesome for terminals with crappy colors (putty!)
set tagstack            "lets you push and pop your jumps with ctrl+]
set pastetoggle=<F11>   "when you're pasting stuff this keeps it from getting
                        "all whacked out with indentation
"set foldmethod=manual   "enable code folding

"javac in vim
"set makeprg=javac\ %
"set errorformat=%A%f:%l\ %m,%-Z%p^,%-C%.%#

"gcc in vim
set makeprg=gcc\ -o\ %<\ %

" Added to default to high security within Gentoo. Fixes bug #14088
set modelines=0

"dictionary word autocomplete. type <CTL-N> in the middle of a word to use
""set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words
set complete-=k complete+=k

"fix broke-ass sun terminals (if we're stuck on one)
"set t_cl=^[[2J

" Don't use Ex mode, use Q for formatting
map Q gq

"collapsing window splits
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

"aspell mapping
map ^P :w!<CR>:!aspell check %<CR>:e! %<CR>

"rot13 dmca-grade encryption
"this is useful to obfuscate whatever it is that you're working on temporarily
"if someone walks by (vim pr0n?)
map <F2> :NERDTreeToggle<CR>
map <F3> mzggVGg?`z
map <silent> <F4> :Sexplore<CR>

" explorer
let g:explVertical=1	" Split vertically
let g:explSplitRight=1    " Put new window to the right of the explorer

"space bar folding
nnoremap  <silent>  <space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l')<cr>

"don't expand tabs if we're in a makefile
au BufRead,BufNewFile Makefile set ts=4 sw=4 noexpandtab
"wrap lines in TeX
au BufRead,BufNewFile *.tex set tw=80
"wrap lines in .txt files
autocmd BufNewFile,BufRead *.txt set tw=78

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

filetype on
filetype plugin on

autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType python setlocal omnifunc=pysmell#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p


:nmap Z :tabprev<CR>
:nmap X :tabnext<CR>

nnoremap <A-S-LeftMouse> mz<LeftMouse><C-v>g`zo<C-g>
inoremap <A-S-LeftMouse> <Esc><C-v>g`^mz<Esc>gi<LeftMouse><C-o><C-v>g`zo<C-g>
vnoremap <A-S-LeftDrag> <LeftDrag>
vnoremap <A-S-LeftMouse> <C-v><LeftMouse>mzgvg`z<C-g>

source $VIMRUNTIME/mswin.vim
behave mswin
"noremap <M-LeftMouse> <4-LeftMouse>
"inoremap <M-LeftMouse> <4-LeftMouse>
"onoremap <M-LeftMouse> <C-C><4-LeftMouse>
"noremap <M-LeftDrag> <LeftDrag>
"inoremap <M-LeftDrag> <LeftDrag>
"onoremap <M-LeftDrag> <C-C><LeftDrag>

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>   "+gP
map <S-Insert> 	"+gP

cmap <C-V>  	<C-R>+
cmap <S-Insert> 	<C-R>+



" python style folding
nnoremap <space> za
vnoremap <space> zf

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Leader 
let mapleader = ","

" Tab configuration
map <leader>tn :tabnew %<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


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

" pysmell
let g:pysmell_matcher="case-sensitive"

" ruby completion
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

"supertab
let g:SuperTabDefaultCompletionType = "context"

"wyszukiwanie w menu
set completeopt=longest,menuone,preview
" dismissing pydoc once completed
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:SuperTabLongestHighlight=1
"hi Pmenu        guifg=#00ffff guibg=#dddddd            ctermbg=0 ctermfg=6
"i PmenuSel     guifg=#ffff00 guibg=#000fff gui=bold   cterm=bold ctermfg=3
"hi PmenuSbar    guibg=#204d40                          ctermbg=6
"hi PmenuThumb   guifg=#38ff56                          ctermfg=3

set guioptions=aAce
set guifont=Monaco\ 11

" map control-backspace to delete the previous word
:imap <C-BS> <C-W>


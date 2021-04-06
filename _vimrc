"weird compatibility things
if &compatible
  set nocompatible
endif
silent! while 0
  set nocompatible
silent! endwhile

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
" Only xterm can grab the mouse events when using the shift key, for other
" terminals use ":", select text and press Esc.
if has('mouse')
  if &term =~ 'xterm'
    set mouse=a
  else
    set mouse=nvi
  endif
endif

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif

augroup vimStartup
au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


if has('gui_running')
    set guifont=Consolas:h11
    set guifontwide=NSimsun:h12
    set lines=40 columns=100
endif

filetype plugin indent on


if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif


" Packages managed by vim 
"   in either Program Files (x86)/Vim/plugins or Vim/pack/......
"
" matchit makes % command work better
if has('syntax') && has('eval')
  packadd! matchit
endif


" set up tag completion, need a tags file with ctags or something?
set complete+=t

set history=200
set backspace=indent,eol,start
set smarttab
set number
set clipboard=unnamed
set shellslash
set expandtab
set shiftwidth=4
set softtabstop=4
set incsearch
set hlsearch
set ruler
set wildmenu
set autoindent
set smartindent
set showcmd
set ttimeout
set ttimeoutlen=100
set display=truncate "show @@@ in the last line if it is truncated
set scrolloff=5
set nrformats-=octal
set laststatus=2
set showtabline=2
set guioptions-=e
set hidden
set ignorecase
set smartcase
set viminfo='100,<50,s10,h
set infercase
color desert

:inoremap <C-J> <C-X>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"This line trys to set the compiler according to the filetype automatically
"for populating the quickfix list
"au BufRead * try | execute "compiler ".&filetype | catch /./ | endtry


"These make a .backup directory and put backup/undo files there
"silent !mkdir .backup
"set backup
"set backupdir=./.backup
"set directory=./.backup
"set writebackup

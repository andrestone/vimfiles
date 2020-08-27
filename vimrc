" The default vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Oct 27
"
" This is loaded if no vimrc file was found.
" Except when Vim is run with "-u NONE" or "-C".
" Individual settings can be reverted with ":set option&".
" Other commands can be reverted as mentioned below.

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Bail out if something that ran earlier, e.g. a system wide vimrc, does not
" want Vim to use these default values.
if exists('skip_defaults_vim')
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
if &compatible
  set nocompatible
endif

" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
  set nocompatible
silent! endwhile

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200		" keep 200 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in a status line

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

" Show @@@ in the last line if it is truncated.
set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

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

" Only do this part when Vim was compiled with the +eval feature.
if 1

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Revert with ":filetype off".
  filetype plugin indent on

  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
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

endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif

" My stuff
" Relative number
set number relativenumber nuw=1

" Show hidden characters 
" set list

" Ignorecase / smartcase
set ignorecase smartcase

" Autocompletion (shell)
set wildmode=longest,list,full

" Split window opens below and to the right (not the opposite)
set splitbelow splitright

" Airline to use powerline fonts 
let g:airline_powerline_fonts = 1

" Leader key
let mapleader = " "

" Spell check
nmap <leader>o :setlocal spell!<CR>

" Copy / Paste
vnoremap <S-C-c> "*y
nmap <S-C-v> "*p

" Enclosables
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O

" NerdTREE behaviour when opening files
map <silent><C-n> :NERDTreeToggle<CR>

" Window Navigation
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-j> <C-W>j
map <C-k> <C-W>k
nnoremap ≥ <C-W>>
nnoremap ≤ <C-W><lt>
nnoremap – <C-W>-
nnoremap ≠ <C-w>+
nmap <S-H> zH
nmap <S-L> zL
inoremap <S-Tab> <Esc>la

" Color
colo gruvbox 
set termguicolors
hi Normal guifg=#c3c3c3 guibg=#101010
hi GruvboxPurple guifg=#9876AA
hi! link GruvboxRed GruvboxOrange
hi! link GruvboxGreen GruvboxOrange
hi! link GruvboxAqua GruvboxOrange
hi GruvboxPurple guifg=#9876AA
hi GruvboxGreen guifg=#759960
hi GruvboxGreenBold guifg=#759960 gui=bold
hi! link GruvboxRed GruvboxOrange
hi! link pythonDecorator GruvboxOrange
hi! link pythonOperator GruvboxOrange
hi! link pythonException GruvboxOrange
hi! link pythonRepeat GruvboxOrange
hi! link pythonConditional Conditional
hi! link Number Normal
hi! link Boolean GruvboxOrange
hi! link typescriptClassKeyword GruvboxOrange
hi! link typescriptInterfaceKeyword GruvboxOrange
hi! link typescriptClassExtends GruvboxOrange
hi! link typescriptArrowFunc GruvboxOrange
hi! link typescriptInterfaceExtends GruvboxOrange
hi! link typescriptAccessibilityModifier GruvboxOrange
hi! link typescriptReadonlyModifier GruvboxOrange
hi! link typescriptPredefinedType GruvboxOrange
hi! link typeScriptDocTags GruvboxGreenBold
hi! link typescriptTestGlobal Label
hi! link typescriptConstructor GruvboxYellow
hi! link typescriptDocComment GruvboxGreen
hi! link typescriptDocNotation GruvboxGreen
hi! link typescriptFuncKeyword GruvboxOrange
hi! link typescriptObjectLabel GruvboxPurple
hi! link typescriptLabel GruvboxYellow
hi! link typescriptCall Normal 
hi! link typescriptForOperator GruvboxOrange
hi! link typescriptTypeReference Normal
hi! link typescriptMember GruvboxPurple
hi! link Keyword GruvboxYellow
hi! link Structure Normal
hi! link String GruvboxGreen
hi! link Statement GruvboxOrange
hi! link Identifier GruvboxOrange
hi! link Function GruvboxYellow
hi! link Label GruvboxOrange
hi! link Conditional GruvboxOrange
hi! link Repeat GruvboxOrange


" Coc stuff
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
map <silent><F7> <Plug>(coc-references)
map <silent><F2> <Plug>(coc-diagnostic-next)
map <silent> <C-S-b> <Plug>(coc-type-definition)
map <silent> <C-S-i> <Plug>(coc-implementation)
inoremap <silent><F7> <Plug>(coc-references)
map <silent> <C-b> <Plug>(coc-definition) 
nnoremap <silent><leader>h :call <SID>show_documentation()<CR>
nnoremap <silent><leader>l :call CocAction('format')<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" fzf
nnoremap <C-f> /
nnoremap <C-S-f> :Ag<CR>


" Load helps
packloadall
silent! helptags ALL
filetype plugin indent on

" no wrap
set nowrap

let NERDTreeShowHidden=1

" Close quickfix after selecting item
autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>

" fixing tab
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

set hidden

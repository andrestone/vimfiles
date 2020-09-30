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
" Cursor shape
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" Relative number
set number relativenumber nuw=1

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

" NerdTREE
map <silent><C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" UndoTREE
nnoremap <leader>u :UndotreeToggle<CR>

" Window Navigation
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-j> <C-W>j
map <C-k> <C-W>k
nnoremap ≥ <C-W>>
nnoremap ≤ <C-W><lt>
nnoremap – <C-W>-
nnoremap ≠ <C-w>+

" Color
colo gruvbox
set termguicolors
let g:gruvbox_contrast_dark = 'hard'
let g:vim_jsx_pretty_colorful_config = 1
hi Normal guifg=#ded8c8 guibg=#1c1b1b
hi GruvboxPurple guifg=#987699
hi ColorColumn guibg=#212121

" This sort of a transformation of Gruvbox into IntelliJ Darcula
" hi! link GruvboxRed GruvboxOrange
" hi! link GruvboxGreen GruvboxOrange
" hi! link GruvboxAqua GruvboxOrange
" hi GruvboxPurple guifg=#9876AA
" hi GruvboxGreen guifg=#759960
" hi GruvboxGreenBold guifg=#759960 gui=bold
" hi! link GruvboxRed GruvboxOrange
" hi! link pythonDecorator GruvboxOrange
" hi! link pythonOperator GruvboxOrange
" hi! link pythonException GruvboxOrange
" hi! link pythonRepeat GruvboxOrange
" hi! link pythonConditional Conditional
" hi! link Number Normal
" hi! link Boolean GruvboxOrange
" hi! link typescriptClassKeyword GruvboxOrange
" hi! link typescriptInterfaceKeyword GruvboxOrange
" hi! link typescriptClassExtends GruvboxOrange
" hi! link typescriptArrowFunc GruvboxOrange
" hi! link typescriptInterfaceExtends GruvboxOrange
" hi! link typescriptAccessibilityModifier GruvboxOrange
" hi! link typescriptReadonlyModifier GruvboxOrange
" hi! link typescriptPredefinedType GruvboxOrange
" hi! link typeScriptDocTags GruvboxGreenBold
" hi! link typescriptTestGlobal Label
" hi! link typescriptConstructor GruvboxYellow
" hi! link typescriptDocComment GruvboxGreen
" hi! link typescriptDocNotation GruvboxGreen
" hi! link typescriptFuncKeyword GruvboxOrange
" hi! link typescriptObjectLabel GruvboxPurple
" hi! link typescriptLabel GruvboxYellow
" hi! link typescriptCall Normal 
" hi! link typescriptForOperator GruvboxOrange
" hi! link typescriptTypeReference Normal
" hi! link typescriptMember GruvboxPurple
" hi! link Keyword GruvboxYellow
" hi! link Structure Normal
" hi! link String GruvboxGreen
" hi! link Statement GruvboxOrange
" hi! link Identifier GruvboxOrange
" hi! link Function GruvboxYellow
" hi! link Label GruvboxOrange
" hi! link Conditional GruvboxOrange
" hi! link Repeat GruvboxOrange


" Coc stuff
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
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
map <F7> <Plug>(coc-references)
map <F2> <Plug>(coc-diagnostic-next)
map <S-C-b> <Plug>(coc-type-definition)
inoremap <F7> <Plug>(coc-references)
map <C-b> <Plug>(coc-definition) 
nnoremap <leader>h :call <SID>show_documentation()<CR>
nnoremap <leader>l :call CocAction('format')<CR>
nmap <leader>ca <Plug>(coc-codeaction)
nmap <leader>cf  <Plug>(coc-fix-current)
nmap <leader>gb :BlamerToggle<CR>

" git blamer
let g:blamer_template = '<author>, <committer-time> • <summary>'

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" git gutter
let g:gitgutter_map_keys = 0
nnoremap <leader>gg :GitGutterToggle<CR>

" commenting
inoremap /**<CR> /**<CR> *<CR>*/<Esc>kA 
xmap <C-_> <Plug>Commentary
nmap <C-_> <Plug>Commentary
omap <C-_> <Plug>Commentary
nmap <C-_> <Plug>CommentaryLine
nmap gcu <Plug>Commentary<Plug>Commentary

" fzf
nnoremap <C-f> :Ag<CR>

" vimspector
nmap <leader><F8>   <Plug>VimspectorAddFunctionBreakpoint
nmap <leader><F9>   <Plug>VimspectorToggleBreakpoint
nmap <leader><F10>   <Plug>VimspectorToggleConditionalBreakpoint
nmap <F4>          <Plug>VimspectorStop
nmap <F5>          <Plug>VimspectorContinue
nmap <F6>          <Plug>VimspectorPause
nmap <F8>          <Plug>VimspectorStepOver
nmap <F9>          <Plug>VimspectorStepInto
nmap <F12>         <Plug>VimspectorStepOut
nmap <leader><F5>  <Plug>VimspectorRestart
nmap <F10>         :call vimspector#Reset()<CR>

" custom winbar
func! CustomiseUI()
  call win_gotoid( g:vimspector_session_windows.code )
  " Clear the existing WinBar created by Vimspector
  nunmenu WinBar
  " Cretae our own WinBar
  nnoremenu WinBar.■\ F4 :call vimspector#Stop()<CR>
  nnoremenu WinBar.▶\ F5 :call vimspector#Continue()<CR>
  nnoremenu WinBar.▷\ F6 :call vimspector#Pause()<CR>
  nnoremenu WinBar.↷\ F8 :call vimspector#StepOver()<CR>
  nnoremenu WinBar.↓\ F9 :call vimspector#StepInto()<CR>
  nnoremenu WinBar.↑\ F12 :call vimspector#StepOut()<CR>
  nnoremenu WinBar.⟲:\ lF5 :call vimspector#Restart()<CR>
  nnoremenu WinBar.✕\ F10 :call vimspector#Reset()<CR>
endfunction

augroup MyVimspectorUICustomistaion
  autocmd!
  autocmd User VimspectorUICreated call CustomiseUI()
augroup END


" no errorbells
set noerrorbells

" backup swap undo
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" no wrap / colorcolumn
set nowrap
set colorcolumn=120
nnoremap <leader>in :IndentGuidesToggle<CR>

" Close quickfix after selecting item
" autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>

" fixing tab
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

" Disable auto-commenting new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" hide buffers instead of closing them
set hidden

" vim-inspector
packadd! vimspector

" Debugging syntax highlighting
nnoremap <leader>f1 :echo synIDattr(synID(line('.'), col('.'), 0), 'name')<cr>
nnoremap <leader>f2 :echo ("hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">")<cr>
nnoremap <leader>f3 :echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<cr>
nnoremap <leader>f4 :exec 'syn list '.synIDattr(synID(line('.'), col('.'), 0), 'name')<cr>

" matchit
packadd! matchit

" typescript compilation
autocmd FileType typescript :set makeprg=tsc
autocmd QuickFixCmdPost [^l]* nested cwindow

" alternative auto change dir (autochdir)
autocmd BufEnter * silent! lcd %:p:h

" markdown syntax highlighting
" let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'ts=typescript', 'typescript', 'js=javascript', 'javascript', 'gql=graphql']
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Load helps
packloadall
silent! helptags ALL
filetype plugin indent on

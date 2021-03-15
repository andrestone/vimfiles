" My stuff
" Cursor shape
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

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
vnoremap <S-C-c> "+y
nmap <S-C-v> "+p

" NerdTREE
map <silent><C-n> :NERDTreeToggle<CR>
map <silent><leader><C-n> :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

" UndoTREE
nnoremap <leader>u :UndotreeToggle<CR>

" insert blank lines with <enter>
function! WindowLeft()
    if (&buftype != "nofile")
      execute "normal! :set wfw!\<CR>"
      execute "normal! \<C-w>h"
      if (&buftype != "nofile")
        execute "normal! :vertical resize 126\<CR>:set wfw\<CR>\<C-w>=0"
      endif
    else
      execute "normal! :set wfw\<CR>"
    endif
endfunction

function! WindowRight()
    if (&buftype != "nofile")
      execute "normal! :set wfw!\<CR>"
      execute "normal! \<C-w>l"
      if (&buftype != "nofile")
        execute "normal! :vertical resize 126\<CR>:set wfw\<CR>\<C-w>=0"
      endif
    else
      execute "normal! :set wfw\<CR>"
      execute "normal! \<C-w>l"
      if (&buftype != "nofile")
        execute "normal! :NERDTreeToggle\<CR>"
      endif
    endif
endfunction

" Window Navigation
" nnoremap <C-h> <C-W>h <C-W>=:vertical resize 126<CR>
tnoremap <silent><C-j> <C-w>N:resize 16<CR>a
tnoremap <silent><C-k> <C-w>N:resize 3<CR>a<C-w>k
tnoremap <silent><C-h> <C-w>N:resize 3<CR>a<C-w>k<C-w>h
tnoremap <silent><C-l> <C-w>N:resize 3<CR>a<C-w>k<C-w>l
nnoremap <C-h> :call WindowLeft()<CR>
nnoremap <C-l> :call WindowRight()<CR>
nnoremap <silent><C-j> <C-W>j
nnoremap <silent><leader><C-j> :Tw<CR>
nnoremap <silent><C-k> <C-W>k
nnoremap <leader><C-l> <C-w>x
nnoremap <Esc>. <C-W>>
nnoremap <Esc>, <C-W><lt>
nnoremap – <C-W>-
nnoremap ≠ <C-w>+

" Color
colo gruvbox
set termguicolors
let g:gruvbox_contrast_dark = 'hard'
let g:vim_jsx_pretty_colorful_config = 1
set  background=dark
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


" nvim-lsp
" set completeopt=menuone,noinsert,noselect
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" nnoremap <C-b> :lua vim.lsp.buf.definition()<CR>
" nnoremap <leader><C-b>vi :lua vim.lsp.buf.implementation()<CR>
" nnoremap <leader>hd :lua vim.lsp.buf.signature_help()<CR>
" nnoremap <F7> :lua vim.lsp.buf.references()<CR>
" nnoremap <leader><C-r> :lua vim.lsp.buf.rename()<CR>
" nnoremap <leader>h :lua vim.lsp.buf.hover()<CR>
" nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>
" " nnoremap <F2> :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
" nnoremap <F2> :lua vim.lsp.diagnostic.goto_next()<CR>
" " nnoremap <leader>vll :lua vim.lsp.diagnostic.set_loclist()<CR>

" Coc stuff
nnoremap <leader>l :call CocAction('format')<CR>:CocCommand eslint.executeAutofix<CR>
nmap <leader>cf  <Plug>(coc-fix-current)
nmap <leader>gb :BlamerToggle<CR>
nmap <leader>ca <Plug>(coc-codeaction)
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
  inoremap <silent><expr> <c-@> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
map <F7> <Plug>(coc-references)
map <F2> <Plug>(coc-diagnostic-next)
map <S-C-b> <Plug>(coc-type-definition)
inoremap <F7> <Plug>(coc-references)
map <C-b> <Plug>(coc-definition)
nnoremap <leader>h :call <SID>show_documentation()<CR>



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
let g:gitgutter_enabled = 0

" commenting
inoremap /**<CR> /**<CR> *<CR>*/<Esc>kA 
xmap <C-_> <Plug>Commentary
nmap <C-_> <Plug>Commentary
omap <C-_> <Plug>Commentary
nmap <C-_> <Plug>CommentaryLine
nmap gcu <Plug>Commentary<Plug>Commentary

" wrapping text with
vnoremap <leader>{ di{<CR>}<ESC>kp
vnoremap <leader>` di``<ESC>hp
vnoremap <leader>[ di[]<ESC>hp
vnoremap <leader>( di()<ESC>hp
vnoremap <leader>" di""<ESC>hp
vnoremap <leader>' di''<ESC>hp
vnoremap <leader>~ di~~<ESC>hp
vnoremap <leader>/* di/*<CR>*/<ESC>kp

" e-regex searches
:nnoremap / /\v
:cnoremap s/ s/\v

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
set backupdir=~/.vim-dirs/backup//
set directory=~/.vim-dirs/swap//
set undodir=~/.vim-dirs/undo//

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
set autochdir
nnoremap <leader>cd :cd %:h<CR>:pwd<CR>

" vtl Template strings
" au BufNewFile,BufRead *.ts,*.js call SyntaxRange#Include('vtl`', '`', 'velocity', 'String')

" markdown syntax highlighting
au BufNewFile,BufRead *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'ts=typescript', 'typescript', 'gql=graphql', 'js=javascript', 'javascript']

" Execute in terminal window
if has('nvim')
  tnoremap <Esc><Esc> <C-\><C-n>
  command! -nargs=+ Tx vsplit term://zsh <args>
  command! Tw sp +set\ winfixheight term://zsh
else
  tnoremap <Esc><Esc> <C-w>N
  command! -nargs=+ Tx :ter ++close <args>
  command! Tw Twsize|:ter ++curwin
  command! -bar Twsize Twindow|:res 16
  command! -bar Twindow :sp +set\ winfixheight
endif
" Load helps
packloadall
silent! helptags ALL
filetype plugin indent on


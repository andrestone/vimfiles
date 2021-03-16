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

" Set nohlsearch
set nohlsearch

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

" Window navigation functions
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


" Coc stuff

" Tab to select completion option
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
let g:coc_snippet_next = '<tab>'

" Shift tab to go previous selection
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Formatting
nnoremap <leader>l :call CocAction('format')<CR>:CocCommand eslint.executeAutofix<CR>

" Apply fix
nmap <leader>cf  <Plug>(coc-fix-current)

" Show available code actions
nmap <leader>ca <Plug>(coc-codeaction)

" Trigger completion
" if has('nvim')
"   inoremap <silent><expr> <c-@> coc#refresh()
" else
"   inoremap <silent><expr> <c-space> coc#refresh()
" endif

" References
" map <F7> <Plug>(coc-references)

" Next diagnostic
" map <F2> <Plug>(coc-diagnostic-next)

" Go to type definition
" map <S-C-b> <Plug>(coc-type-definition)

" Go to definition
" map <C-b> <Plug>(coc-definition)

" Show documentation (hover) or help
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
" nnoremap <leader>h :call <SID>show_documentation()<CR>

" Git blamer
let g:blamer_template = '<author>, <committer-time> • <summary>'
nmap <leader>gb :BlamerToggle<CR>


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

" fixing tab
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

" Disable auto-commenting new lines
autocmd FileType,BufNew,BufRead * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" hide buffers instead of closing them
set hidden

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

" markdown syntax highlighting
au BufNewFile,BufRead *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'ts=typescript', 'typescript', 'gql=graphql', 'js=javascript', 'javascript']

" Load helps
packloadall
silent! helptags ALL
filetype plugin indent on

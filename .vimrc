
"""""""""""""""""""""""""""""""
" BEHAVIOR
"""""""""""""""""""""""""""""""
" Cursor
set backspace=eol,start,indent
set whichwrap+=<,>,[,]
set cursorline

" Tabs and indentation
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent

" Text
set textwidth=80
set colorcolumn=+1
set incsearch   
set mouse=n
set so=7

" Tabs and buffers
set hidden

"""""""""""""""""""""""""""""""
" MAPPINGS
"""""""""""""""""""""""""""""""
inoremap {<Enter> {<Esc>o}<Esc>O
inoremap " ""<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap ' ''<Left>
inoremap < <><Left>
inoremap <C-x> <Esc>
inoremap <C-z> <Esc>

" Map back-quote to various multiline comment styles.
au FileType c,javascript inoremap ` /**<Enter><Space>*/<Esc>O*<Space>
au FileType python inoremap ` """<Esc>o"""<Esc>O<Tab>
au FileType html inoremap ` <!-- --><Left><Left><Left>
au FileType sh inoremap ` #<Enter>#<Enter>#<Enter><Up><Space>

" Navigation
nore ; :
nore <A-Left> ^
nore <A-Right> $
nore <C-Left> b
nore <C-Right> w
nore <C-Up> 5<Up>
nore <C-Down> 5<Down>
nore <A-Up> gg
nore <A-Down> G

inoremap <A-Left> <Esc>^i
inoremap <A-Right> <Esc>$i
inoremap <C-Left> <Esc>bi
inoremap <C-Right> <Esc>wwi
inoremap <C-Up> <Esc>5<Up>i
inoremap <C-Down> <Esc>5<Down>i
inoremap <A-Up> <Esc>ggi
inoremap <A-Down> <Esc>Gi

command Cheat !cat ~/Docs/vimhelp.txt

"""""""""""""""""""""""""""""
" UI
"""""""""""""""""""""""""""""
" Status line and command line
set laststatus=2
set statusline=<%n>\ %f\ \ \ \ %L\ Lines
set timeoutlen=1000 ttimeoutlen=0

" General
set nu
syntax enable
colorscheme monokai

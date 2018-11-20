"""""""""""""""""""""""""""""""
" BEHAVIOR
"""""""""""""""""""""""""""""""
" Cursor
set backspace=eol,start,indent
set whichwrap+=<,>,[,]
set cursorline
set mouse=a

" Tabs and indentation
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent

" Text
set textwidth=80
set colorcolumn=+1
set incsearch   
set hlsearch
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
inoremap <C-x> <Esc>
inoremap <C-z> <Esc>

" Map back-quote to various multiline comment styles.
au FileType c,javascript,cpp inoremap ` /*<Enter><Space>*/<Esc>O*<Space>
au FileType python inoremap ` """<Esc>o"""<Esc>O<Tab>
au FileType html inoremap ` <!-- --><Esc>bhi | setlocal softtabstop=2 | setlocal shiftwidth=2 | inoremap < <><Left>
au FileType sh inoremap ` #<Enter>#<Enter>#<Enter><Up><Space>
au FileType css inoremap ` /*<space><space>*/<C-left><left>

" Navigation
nore <Tab> gt
nore ; :
nore <A-Left> ^
nore <A-Right> $
nore <C-Left> b
nore <C-Right> w
nore <C-Up> 5<Up>
nore <C-Down> 5<Down>
nore <A-Up> gg
nore <A-Down> G

inoremap <A-Right> <Esc>$i
inoremap <C-Left> <Esc>bi
inoremap <C-Right> <Esc>wwi
inoremap <C-Up> <Esc>5<Up>i
inoremap <C-Down> <Esc>5<Down>i
inoremap <A-Up> <Esc>ggi
inoremap <A-Down> <Esc>Gi

" Leader mappings
inoremap <leader>c <Esc><right>cw

command Cheat !cat ~/Docs/vimhelp.txt

"""""""""""""""""""""""""""""
" UI
"""""""""""""""""""""""""""""
" Status line and command line
set laststatus=2
set timeoutlen=1000 ttimeoutlen=0

" General
set nu

"""""""""""""""""""""""""""""
" Plugins 
"""""""""""""""""""""""""""""
syntax enable
colorscheme monokai

" incsearch.vim
execute pathogen#infect()

call plug#begin()
Plug 'haya14busa/incsearch.vim'
Plug 'itchyny/lightline.vim'
call plug#end()

let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" lightline
set noshowmode
let g:lightline = { 'colorscheme': 'wombat' }

" NERDTree
map <C-n> :NERDTreeToggle<CR>

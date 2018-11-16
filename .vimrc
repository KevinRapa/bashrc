set nu

set textwidth=80
set colorcolumn=+1
set so=7

set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

set autoindent
set smartindent
set incsearch   

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

inoremap {<Enter> {<Enter><Enter>}<Up><Tab>
inoremap " ""<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap ' ''<Left>
inoremap < <><Left>
inoremap <C-x> <Esc>
inoremap <C-z> <Esc>

" Map back-quote to various multiline comment styles.
au FileType c,javascript inoremap ` /**<Enter><Enter><Space>*/<Up><Space>*<Space>
au FileType py inoremap ` """<Enter><Enter>"""<Up><Tab>
au FileType html inoremap ` <!-- --><Left><Left><Left>
au FileType sh inoremap ` #<Enter>#<Enter>#<Enter><Up><Space>

" Mappings for easier navigation
nore ; :
nore <F1> :bnext<CR>
nore <F2> :bprev<CR>
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

set timeoutlen=1000 ttimeoutlen=0

" Stuff for status line
set laststatus=2
set statusline=[%n]\ %f\ \ \ \ %L\ Lines

syntax enable
colorscheme monokai

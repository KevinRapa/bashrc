set nu
highlight LineNr cterm=bold ctermfg=Black ctermbg=Gray

highlight ColorColumn ctermbg=Magenta
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

set timeoutlen=1000 ttimeoutlen=0

" Stuff for status line
set laststatus=2
hi StatusLine ctermfg=Gray
set statusline=[%n]\ %f\ \ \ \ Line\ %l/%L

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vunde manage Vundle
Plugin 'gmarik/Vundle.vim'

" originial repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sleuth'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe', {'do': './install.sh --clang-completer'}
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'https://bitbucket.org/goeb/vimya.git'
Plugin 'w0ng/vim-hybrid'
Plugin 'terryma/vim-expand-region'
Plugin 'godlygeek/tabular'
Plugin 'tikhomirov/vim-glsl'
Plugin 'neilagabriel/vim-geeknote'
Plugin 'gabesoft/vim-ags'
Plugin 'vim-scripts/Conque-GDB', {'on': 'ConqueGDB'}
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Bundle 'ervandew/supertab'
call vundle#end()

filetype plugin indent on
let mapleader = ","

" Tabstops
set tabstop=2
set shiftwidth=4
set softtabstop=2
set autoindent
set wrapscan
set noignorecase
set ch=2
set backspace=2
set laststatus=2
set lazyredraw
set showcmd
set mousehide
set history=700
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
set scrolloff=8
set virtualedit=all
"disable encryption
set key=
set wildmenu
set textwidth=80
set diffopt+=iwhite
set fillchars=""
set showfulltag
set hlsearch
set incsearch
set clipboard+=unnamed
set autoread
set synmaxcol=2048

"""""FUNCTIONALITY
set nocp
set noerrorbells
set history=1000
set number
set guioptions=em
set showtabline=2

"clear highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

"cd to dir contatining file in buffer
nmap <silent> <leader>cd :lcd %:h<CR>
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

"set text wrapping toggles
nmap <silent> ,ww :set invwrap<CR>:set wrap?<CR>

"Search curr file for curr in search reg
nmap <silent> <leader>gs :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

"Window Shifting
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

"keep code folding
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

"save file
nnoremap <leader>w :w<CR>

nnoremap j gj
nnoremap k gk

"GUI
syntax enable
let g:ycm_key_detailed_diagnostics= '<leader>D'

"""""PLUGIN CONF

"nerdcommenter
let NERDSpaceDelims=1

"vimya
let g:vimyaShowLog = 1
let g:vimyaTailCommand = 'Tail'
nnoremap <leader>mo :py vimyaOpenLog ()<cr>
vnoremap <leader>mr :py vimyaRefreshLog ()<cr>

"NERDTree
map <leader>d :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeKeepTreeInNewTab=1

"Tagbar
map <leader>t :TagbarToggle<CR>

"Expand Region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:\zs<CR>
vmap <leader>a: :Tabularize /:\zs<CR>

"Geeknote
noremap <leader>g :Geeknote<CR>

"YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"Conque
let g:ConqueTerm_Color = 2
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_StartMessages = 0

" Ultisnip
" let g:UltiSnipsEnableSnipMate = 0 " don't look for SnipMate snippets, in the 'snippets' dir
" let g:UltiSnipsSnippetDirectories=["snippets_UltiSnips"]

" Fix YCM + snippets

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<s-enter>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


" AGS fix stupid args
let g:ags_agargs = {
						\ '--break'             : [ '', '' ],
						\ '--color'             : [ '', '' ],
						\ '--color-line-number' : [ '"1;30"', '' ],
						\ '--color-match'       : [ '"32;40"', '' ],
						\ '--color-path'        : [ '"1;31"', '' ],
						\ '--column'            : [ '', '' ],
						\ '--context'           : [ 'g:ags_agcontext', '-C', '3' ],
						\ '--group'             : [ '', '' ],
						\ '--heading'           : [ '', '-H' ],
						\ '--max-count'         : [ 'g:ags_agmaxcount', '-m', '2000' ],
						\ }

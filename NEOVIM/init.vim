  "      ██      ██ ██ ████     ████ ███████     ██████ 
  "     ░██     ░██░██░██░██   ██░██░██░░░░██   ██░░░░██
  "     ░██     ░██░██░██░░██ ██ ░██░██   ░██  ██    ░░ 
  "     ░░██    ██ ░██░██ ░░███  ░██░███████  ░██       
  "      ░░██  ██  ░██░██  ░░█   ░██░██░░░██  ░██       
  "   ██  ░░████   ░██░██   ░    ░██░██  ░░██ ░░██    ██
  "  ░██   ░░██    ░██░██        ░██░██   ░░██ ░░██████ 
  "  ░░     ░░     ░░ ░░         ░░ ░░     ░░   ░░░░░░  

call plug#begin('~/.config/nvim/plugged')
   
    " Better Syntax Support
    " Plug 'sheerun/vim-polyglot'

    " File Explorer
    Plug 'scrooloose/NERDTree'

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    " Auto completion - not exactly auto-completion , it is based on our local files
    Plug 'ervandew/supertab'

    " Color Scheme
    Plug 'flazz/vim-colorschemes'

    " Surrounding ,, ysw) , ysiw) , ys2w) , ys2iw) ,, ysw( = it gonna leave
    " somespace on around ,, but if you use ysw) it won't gonan leave space around
    " Plug 'http://github.com/tpope/vim-surround'

    " For commenting , gcc , gc
    Plug 'https://github.com/tpope/vim-commentary'

    " Status Bar
    Plug 'https://github.com/vim-airline/vim-airline'

    " color preview
    Plug 'https://github.com/ap/vim-css-color'

    " AutoCompletion ,, extra to do is :CocInstall coc-python , coc-clangd -- in ex-command " CocCommand clangd.install" and i also did sudo apt install ccls
    Plug 'https://github.com/neoclide/coc.nvim'

    " File Icons in NERDTree
    Plug 'https://github.com/ryanoasis/vim-devicons'

    " Multiple Cursors , ctrl+n 
    " Plug 'https://github.com/terryma/vim-multiple-cursors'

    "Tagbar for code navigation ,, the extra thing i did is this -> apt install exuberant-ctags
    Plug 'https://github.com/preservim/tagbar'

    " kivy language syntax support
    " Plug 'farfanoide/vim-kivy'

    " Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal

    " nerdtree icons
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    "Dart/Flutter
    " Plug 'dart-lang/dart-vim-plugin'
    " Plug 'thosakwe/vim-flutter'
    " Plug 'natebosch/vim-lsc'
    " Plug 'natebosch/vim-lsc-dart'

    " Plug 'EdenEast/nightfox.nvim' " Vim-Plug
    " Plug 'https://github.com/sbdchd/neoformat'

    Plug 'https://github.com/vim-scripts/ScrollColors' "This is colorscheme Scroller/Chooser/Browser.

call plug#end()

:set mouse=a
" :set number
:set relativenumber
:set autoindent
:set tabstop=4 "4 charecters "
:set shiftwidth=4 " when i press >> or <<" 
:set expandtab " convert tab charecters into spaces"
:set smartcase " affectevely case sensitive searching until i put in a capital letter"
:set noswapfile " don't create the swap files"
:set nobackup
:set smarttab
:set softtabstop=4 " 4 spaces
:set encoding=UTF-8
:set nowrap " infinity width 
:set nu " see the current line number 
:set incsearch " / and type
:set bg=dark
:set scrolloff=5 " while scrolling give 5 lines free
:set completeopt+=preview " For Previews-autocompletion
" :set colorcolumn=100 " " it puts a line on the specified column
:set nocursorline
" highlight ColorColumn ctermbg=0 guibg=lightgray

" specifying to use the system clipboard for copy and paste.
:set clipboard=unnamedplus

syntax on

set termguicolors
colorscheme deep-space
" colorscheme happy_hacking

" Airline status bar configuration
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_theme='hybrid'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 0


" enable all Python syntax highlighting features
let python_highlight_all = 1

" NERDTree configuration
" let g:NERDTreeDirArrowExpandable="+"
" let g:NERDTreeDirArrowCollapsible="~"

:map <F8> :TagbarToggle<CR>
:map <C-f> :NERDTreeToggle<CR>
:map <C-t> :TerminalSplit bash<CR>
" "+y is used to yank/copy items into the system clipboard,
" "+p to paste items into the system clipboard
:map <C-y> "+y
:map <C-p> "+p
:map <C-s> :w<CR>
:map <C-q> :q<CR>
" clearing the last search highlighting when press <Esc>
nnoremap <silent><esc>  :noh<return><esc>

" window resizing
noremap <silent> <C-Left> :vertical resize -2<CR>
noremap <silent> <C-Right> :vertical resize +2<CR>
noremap <silent> <C-Up> :resize +2<CR>
noremap <silent> <C-Down> :resize -2<CR>

" multi-window navigations
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Start terminals for R and Python sessions '\tr' or '\tp' 
map <Leader>tr :new term://bash<CR>iR<CR><C-\><C-n><C-w>k
map <Leader>tp :new term://bash<CR>ipython3<CR><C-\><C-n><C-w>k


" :echo @% 	                def/my.txt 	        directory/name of file (relative to the current working directory of /abc)
" :echo expand('%:t') 	    my.txt 	            name of file ('tail')
" :echo expand('%:p') 	    /abc/def/my.txt 	full path
" :echo expand('%:p:h') 	/abc/def 	        directory containing file ('head')
" :echo expand('%:p:h:t') 	def 	            First get the full path with :p (/abc/def/my.txt), then get the head of that with :h (/abc/def), then get the tail of that with :t (def)
" :echo expand('%:r') 	    def/my 	            name of file less one extension ('root')
" :echo expand('%:e') 	    txt 	            name of file's extension ('extension') 


" CODE RUNNER

let supported_files = {"py":1,"c":1}
if get(supported_files,expand('%:e'),0)
    let executor_map = {
                \"py":"cd ".expand('%:p:h')." ; python -u ".expand('%:t')."<cr>",
                \"c":"cd ".expand('%:p:h')." ; gcc ".expand('%:t')." -o main ; ./main"."<cr>"
                \}
    execute "nnoremap <F5> :!".executor_map[expand('%:e')]
endif


" Start NERDTree
" autocmd VimEnter * NERDTree
" Go to previous (last accessed) window.
" autocmd VimEnter * wincmd p

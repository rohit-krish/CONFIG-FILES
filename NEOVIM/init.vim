  "      ██      ██ ██ ████     ████ ███████     ██████ 
  "     ░██     ░██░██░██░██   ██░██░██░░░░██   ██░░░░██
  "     ░██     ░██░██░██░░██ ██ ░██░██   ░██  ██    ░░ 
  "     ░░██    ██ ░██░██ ░░███  ░██░███████  ░██       
  "      ░░██  ██  ░██░██  ░░█   ░██░██░░░██  ░██       
  "   ██  ░░████   ░██░██   ░    ░██░██  ░░██ ░░██    ██
  "  ░██   ░░██    ░██░██        ░██░██   ░░██ ░░██████ 
  "  ░░     ░░     ░░ ░░         ░░ ░░     ░░   ░░░░░░  

call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/NERDTree' " File Explorer
Plug 'jiangmiao/auto-pairs' " Auto pairs for '(' '[' '{'
Plug 'ervandew/supertab' " Auto completion - not exactly auto-completion , it is based on our local files
Plug 'flazz/vim-colorschemes' " Color Scheme
Plug 'https://github.com/tpope/vim-commentary' " For commenting , gcc , gc
Plug 'https://github.com/vim-airline/vim-airline' " Status Bar
Plug 'https://github.com/ap/vim-css-color' " color preview
Plug 'https://github.com/neoclide/coc.nvim', {'for':['python','c']} " AutoCompletion ,, extra to do is :CocInstall coc-python , coc-clangd -- in ex-command ' CocCommand clangd.install' and i also did sudo apt install ccls
Plug 'https://github.com/ryanoasis/vim-devicons', " File Icons in NERDTree
Plug 'https://github.com/preservim/tagbar', {'on':'TagbarToggle','for':['python','c']} "Tagbar for code navigation ,, the extra thing i did is this -> apt install exuberant-ctags
" Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', " nerdtree icons
Plug 'https://github.com/vim-scripts/ScrollColors',{'on':'SCROLLCOLOR'} "This is colorscheme Scroller/Chooser/Browser.
Plug 'https://github.com/dstein64/vim-startuptime',{'on':'StartupTime'}

call plug#end()

:set mouse=a
:set encoding=UTF-8
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

:set bg=dark
:set scrolloff=5 " while scrolling give 5 lines free
:set completeopt-=preview " For Previews-autocompletion
" :set colorcolumn=100 " " it puts a line on the specified column
:set nocursorline
" highlight ColorColumn ctermbg=0 guibg=lightgray

" specifying to use the system clipboard for copy and paste.
:set clipboard=unnamedplus

" select autocompleted pop up with [ENTER]
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" trigger autocompletion with Ctrl+Space
inoremap <silent><expr> <c-space> coc#refresh()

syntax on

set termguicolors
colorscheme deep-space
" colorscheme happy_hacking

" airline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_theme='hybrid'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_powerline_fonts = 1

" enable all Python syntax highlighting features
" let python_highlight_all = 1

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
" map <Leader>tr :new term://bash<CR>iR<CR><C-\><C-n><C-w>k
map <Leader>tr :new term://bash<CR>iR<CR>
map <Leader>tp :new term://bash<CR>ipython3<CR><C-\><C-n><C-w>k


" :echo @% 	                def/my.txt 	        directory/name of file (relative to the current working directory of /abc)
" :echo expand('%:t') 	    my.txt 	            name of file ('tail')
" :echo expand('%:p') 	    /abc/def/my.txt 	full path
" :echo expand('%:p:h') 	/abc/def 	        directory containing file ('head')
" :echo expand('%:p:h:t') 	def 	            First get the full path with :p (/abc/def/my.txt), then get the head of that with :h (/abc/def), then get the tail of that with :t (def)
" :echo expand('%:r') 	    def/my 	            name of file less one extension ('root')
" :echo expand('%:e') 	    txt 	            name of file's extension ('extension') 


" CODE RUNNER [ just like the extension in vscode ]

function! CodeRunner()
    let supported_files = {"py":1,"c":1}
    if get(supported_files,expand('%:e'),0)
        let executor_map = {
                    \"py":"cd \"".expand('%:p:h')."\" ; python -u \"".expand('%:t')."\"",
                    \"c":"cd \"".expand('%:p:h')."\" ; gcc \"".expand('%:t')."\" -o main ; ./main"
                    \}
        execute ":!".executor_map[expand('%:e')]
        " execute ":belowright vertical new term://bash<CR>i".executor_map[expand('%:e')]
    endif
endfunction

nnoremap <F5> :call CodeRunner()<CR>

nnoremap <A-t> :belowright vertical new term://zsh<CR>

" Start NERDTree
" autocmd VimEnter * NERDTree
" Go to previous (last accessed) window.
" autocmd VimEnter * wincmd p

" Basic Config
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set ignorecase
set termguicolors
set mouse=a

set nocompatible
set hidden
set encoding=UTF-8
" Disable comment new line (Doesn't work)
" set formatoptions-=ro

" Search
set noincsearch
set nohlsearch
" nnoremap <C-_> :CommentPlugin<cr>
" nnoremap <M-/> :noh<cr>

" Leader
let mapleader = " "
" nohighlighting to leader
"map <leader>h :noh<CR>

" JK as Esc
inoremap jk <Esc>

" Yank into system clipboard
vnoremap <M-y> "+y
vnoremap <M-p> "+p

" Buffers management
nnoremap <C-s> :w<cr>
nnoremap <leader>x <cmd>q<cr> 
" Close others
nnoremap <leader>qw <cmd>%bd<bar>e#<bar>bd#<cr> 
" Close current
nnoremap <leader>qq <cmd>bp<bar>sp<bar>bn<bar>bd<cr>

" Remap arrow keys to resize window
nnoremap <silent> <C-Right> :vertical resize +2<CR>
nnoremap <silent> <C-Left>  :vertical resize -2<CR>
nnoremap <silent> <C-Up>    :resize -2<CR>
nnoremap <silent> <C-Down>  :resize +2<CR>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Plugins
call plug#begin()

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'

" Status bar
Plug 'vim-airline/vim-airline'

" Fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" File tree
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'

" Sessions
Plug 'tpope/vim-obsession'

" Use :Tab /: to make align in tabular
Plug 'godlygeek/tabular'

" Markdown
Plug 'preservim/vim-markdown', { 'for': 'markdown' }

" Tab management
" Plug 'vim-ctrlspace/vim-ctrlspace'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Formatting and Linting
Plug 'dense-analysis/ale'

" Colorscheme
Plug 'bluz71/vim-moonfly-colors'

" Git
Plug 'vim-scripts/vim-gitgutter'

call plug#end()

" Nerd tree
" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Nerdfont git plugin
let g:NERDTreeGitStatusUseNerdFonts = 1

" Colorscheme
colorscheme moonfly

" Ale Config
let g:ale_linters = {
\   'python': ['flake8']
\}

let g:ale_fixers = {
\   'markdown': ['prettier'],
\   'python': ['isort','black']
\}

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_python_flake8_options = '--max-line-length=200'
set omnifunc=ale#completion#OmniFunc

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2

" Airline
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1
" let g:airline#extensions#tabline#tabs_label = 't'
" let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
" nmap <leader>k <Plug>AirlineSelectPrevTab
" nmap <leader>j <Plug>AirlineSelectNextTab

" nmap <leader>1 :1buffer<CR>
" nmap <leader>2 :2buffer<CR>
" nmap <leader>3 :3buffer<CR>
" nmap <leader>4 :4buffer<CR>
" nmap <leader>5 :5buffer<CR>
" nmap <leader>6 :6buffer<CR>
" nmap <leader>7 :7buffer<CR>
" nmap <leader>8 :8buffer<CR>
" nmap <leader>9 :9buffer<CR>
" nmap <leader>0 :10buffer<CR>
nmap <leader>k :bnext<CR>
nmap <leader>j :bprev<CR>
nmap <leader>l :tabnext<CR>
nmap <leader>h :tabprev<CR>
nmap <leader>; :b#<CR>


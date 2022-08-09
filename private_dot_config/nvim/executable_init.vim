" Basic Config
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set ignorecase

set nocompatible
set hidden
set encoding=utf-8

" Search
set noincsearch
set nohlsearch

" Leader
let mapleader = " "
" nohighlighting to leader
"map <leader>h :noh<CR>

" JK as Esc
inoremap jk <Esc>

" Yank into system clipboard
vnoremap <M-y> "+y
vnoremap <M-p> "+p

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
Plug 'vim-airline/vim-airline-themes'

" Fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" File tree
Plug 'preservim/nerdtree'

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

" Linting

call plug#end()

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2

" Airline
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1
" let g:airline#extensions#tabline#tabs_label = 't'
" let g:airline#extensions#tabline#buffers_label = 'b'

let g:airline_theme='deus'
" let g:airline_powerline_fonts = 1

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
nmap <leader>j :bnext<CR>
nmap <leader>k :bprev<CR>
nmap <leader>l :tabnext<CR>
nmap <leader>h :tabprev<CR>

" nnoremap <M-1> :1tabnext<CR>
" nnoremap <M-2> :2tabnext<CR>
" nnoremap <M-3> :3tabnext<CR>
" nnoremap <M-4> :4tabnext<CR>
" nnoremap <M-5> :5tabnext<CR>
" nnoremap <M-6> :6tabnext<CR>
" nnoremap <M-7> :7tabnext<CR>
" nnoremap <M-8> :8tabnext<CR>
" nnoremap <M-9> :9tabnext<CR>
" nnoremap <M-0> :10tabnext<CR>

" Tabs
" let g:airline#extensions#ctrlspace#enabled = 1
" let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"
" let g:CtrlSpaceDefaultMappingKey = "<C-space> "
" let g:airline#extensions#tabline#buffer_nr_show = 0
" let g:airline#extensions#tabline#ctrlspace_show_tab_nr = 1

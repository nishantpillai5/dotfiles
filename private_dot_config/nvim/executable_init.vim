" Basic Config
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set ignorecase
set termguicolors
set mouse=a
set smartcase
" set cc=80 " Column border
set wildmode=longest,list " Bash like completion
set splitright
set splitbelow

let g:python3_host_prog = '/usr/bin/python3'

" filetype plugin on
" set omnifunc=syntaxcomplete#Complete

set nocompatible
set hidden
set encoding=UTF-8
" Disable comment new line (Doesn't work)
" set formatoptions-=ro

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" open file in a text by placing text and gf
" nnoremap gf :vert winc f<cr>
" copies filepath to clipboard by pressing yf
" nnoremap <silent> yf :let @+=expand('%:p')<CR>
" copies pwd to clipboard: command yd
" nnoremap <silent> yd :let @+=expand('%:p:h')<CR>

" Spell languages
" set spelllang=en
set spellsuggest=best,9
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en,cjk
" map <leader>hs setlocal spell!<CR>

" Search
set noincsearch
set nohlsearch
nnoremap <C-_> :Commentary<cr>
" nnoremap <M-/> :noh<cr>

" Leader
let mapleader = " "
" nohighlighting to leader
map <leader>hh :noh<CR>

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
" nnoremap <leader>tf :NERDTreeFocus<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" Markdown Preview
nnoremap <leader>m :MarkdownPreviewToggle<CR>
let g:mkdp_auto_close = 0
let g:mkdp_page_title = '${name}'

" Plugins
call plug#begin()


" Hop
Plug 'phaazon/hop.nvim'

" Comment
Plug 'tpope/vim-commentary'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

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
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'mmai/vim-markdown-wiki'

" Tab management
" Plug 'vim-ctrlspace/vim-ctrlspace'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'p00f/nvim-ts-rainbow'
Plug 'lukas-reineke/indent-blankline.nvim'

" Formatting and Linting
Plug 'dense-analysis/ale'

" Colorscheme
Plug 'bluz71/vim-moonfly-colors'

" Git
Plug 'vim-scripts/vim-gitgutter'

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Zotero
Plug 'jalvesaq/zotcite'

" Auto complete
Plug 'ervandew/supertab'

" Git
Plug 'sindrets/diffview.nvim'

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
" let g:ale_completion_enabled = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_python_flake8_options = '--max-line-length=200'
" set omnifunc=ale#completion#OmniFunc

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2

" Preview
" let g:mkdp_echo_preview_url = 1
" let g:mkdp_auto_start = 1

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

nmap <leader>k :bnext<CR>
nmap <leader>j :bprev<CR>
nmap <leader>l :tabnext<CR>
nmap <leader>h :tabprev<CR>
nmap <leader>; :b#<CR>
nnoremap <leader><tab> :b#<CR>

" CoC
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

let g:airline#extensions#coc#enabled = 0

" Treesitter

lua << EOF
-- Treesitter
require'nvim-treesitter.configs'.setup {
	ensure_installed = {"python"},
	auto_install = true,
	highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true, 
  },
  context_commentstring = {
    enable = true,
    commentary_integration = {
      -- change default mapping
      Commentary = 'g/',
      -- disable default mapping
      CommentaryLine = false,
    },
  }
}
-- Hop 
require'hop'.setup{
	quit_key = '<SPC>',
	uppercase_labels = true,
}
vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})

-- Indent
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
EOF

nnoremap <leader><space> <cmd>HopChar2<cr>

" Tabularize
" if exists(":Tabularize")
" 	nmap <leader>>= :Tabularize /=<CR>
" 	vmap <leader>>= :Tabularize /=<CR>
" 	nmap <leader>>: :Tabularize /:\zs<CR>
" 	vmap <leader>>: :Tabularize /:\zs<CR>
" endif

" Zotero
let zotcite_open_in_zotero = 1
" let zotcite_conceallevel = 2

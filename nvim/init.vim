syntax on
filetype plugin indent on

let mapleader = " "

set exrc
set guicursor=n-v-c-i:block-Curso
set cursorcolumn
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set autoindent
set tabstop=4 softtabstop=4
set showmatch " Shows matching brackets
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set colorcolumn=100
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set cmdheight=1
set updatetime=50
set splitright " open new split panes to right and below
set splitbelow

call plug#begin('~/.config/nvim/plugged')
"Themes
Plug 'gruvbox-community/gruvbox'
Plug 'sts10/vim-pink-moon'
Plug 'arzg/vim-colors-xcode'

"Utilities
Plug 'ap/vim-css-color'
Plug 'mbbill/undotree'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'mhinz/vim-signify'
Plug 'liuchengxu/vim-which-key'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

"Search and autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Terminal
Plug 'voldikss/vim-floaterm'
call plug#end()

source ~/.config/nvim/plug-config/coc.vim
source ~/.config/nvim/plug-config/which-key.vim

set background=dark
colorscheme pink-moon 
highlight Normal guibg=none

"Coc.vim configuration
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
"end of coc.vim config

"Function that returns the current git branch
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

"returns the number of linter errors
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d⨉ %d⚠ ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

"Close vim if the only window left its filetree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Change NerdTree arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#hunks#enabled=1
let g:airline_section_b='%{GitBranch()}'
let g:airline_section_y='%{LinterStatus()}'
let g:airline_theme='deus'
let NERDTreeShowHidden=1
let g:vue_pre_processors = 'detect_on_enter'

nnoremap <leader>udt :UndotreeToggle<CR>
nnoremap <leader>ntt :NERDTreeToggle<CR>

"live preview of markdown files
nmap <leader>md :MarkdownPreviewToggle<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>sz <cmd>Telescope find_files<cr>
nnoremap <leader>st <cmd>Telescope live_grep<cr>
nnoremap <leader>sB <cmd>Telescope buffers<cr>

"move line up or down
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <ESC>:m .+1<CR>==gi
inoremap <A-Up> <ESC>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

"Divide in new line
nnoremap <C-n> i<CR><ESC>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

"'' Floatterm ''"
if filereadable(expand("~/.config/nvim/plugged/vim-floaterm/plugin/floaterm.vim"))
  nnoremap <leader>fl :FloatermNew --autoclose=2 --height=0.8 --width=0.8 --wintype=floating lazygit<CR>
  nnoremap <leader>ft :FloatermNew --autoclose=2 --height=0.75 --width=0.75 --wintype=floating<CR>
endif
" Floatterm Configuration
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'


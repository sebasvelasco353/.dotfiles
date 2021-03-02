source ~/.config/nvim/plug-config/coc.vim

syntax on
filetype plugin indent on

set exrc
set guicursor=n-v-c-i:block-Curso
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
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ntk148v/vim-horizon'
Plug 'ajmwagar/vim-deus'

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

"Search and autocomplete
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Terminal
Plug 'voldikss/vim-floaterm'
call plug#end()

set background=dark
colorscheme palenight
"colorscheme gruvbox
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

let mapleader = " "

"Open nerdTree automatically when no file is selected on vim start
autocmd StdinReadPre * let s:std_in=1 
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"Open NerdTree when i open a folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
"Close vim if the only window left its filetree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Change NerdTree arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:AirlineTheme='hunks'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#hunks#enabled=1
let g:airline_section_b='%{GitBranch()}'
let g:airline_section_y='%{LinterStatus()}'
let g:airline_theme='wombat'
let NERDTreeShowHidden=1
let g:vue_pre_processors = 'detect_on_enter'

map <ScrollWheelDown> j
map <ScrollWheelUp> k

nnoremap <leader>udt :UndotreeToggle<CR>
nnoremap <leader>ntt :NERDTreeToggle<CR>
nnoremap <leader>q :bd #<CR>
nnoremap <leader>fzf :GFiles<CR>
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


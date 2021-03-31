" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey ' '<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

"Single mappings
let g:which_key_map['ci'] = [ '<Plug>NERDCommenterToggle'  , 'comment' ]
let g:which_key_map['B'] = [ ':Telescope buffers'  , 'buffers' ]
let g:which_key_map['udt'] = [ ':UndotreeToggle'  , 'undo tree' ]
let g:which_key_map['ntt'] = [ ':NERDTreeToggle'  , 'NERD tree' ]
let g:which_key_map['md'] = [':MarkdownPreviewToggle', 'Mearkdown Live Preview']

let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Telescope buffers', 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Telescope live_grep', 'text Rg'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':Telescope find_files', 'Fuzzy Find'],
      \ }

let which_key_map.f = {
                  \ 'name' : '+Floating-Terminal',
                  \ 'l' : [':FloatermNew --autoclose=2 --height=0.8 --width=0.8 --wintype=floating lazygit', 'LazyGit'],
                  \ 't' : [':FloatermNew --autoclose=2 --height=0.75 --width=0.75 --wintype=floating', 'New Terminal'],
                  \ }

let g:which_key_map['c'] = { 'name': 'which_key_ignore' }
let g:which_key_map['n'] = { 'name': 'which_key_ignore' }
let g:which_key_map['u'] = { 'name': 'which_key_ignore' }

" Register which key map
call which_key#register(' ', "g:which_key_map")

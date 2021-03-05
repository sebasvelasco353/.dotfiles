let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
let g:startify_bookmarks = [
            \ '~/Documents',
            \ '~/.dotfiles',
            \ ]
let g:startify_custom_header = [
            \' __      ________ _                _____  _____ ____  _____  ______',
            \' \ \    / /  ____| |        /\    / ____|/ ____/ __ \|  __ \|  ____|',
            \'  \ \  / /| |__  | |       /  \  | (___ | |   | |  | | |  | | |__   ',
            \'   \ \/ / |  __| | |      / /\ \  \___ \| |   | |  | | |  | |  __|  ',
            \'    \  /  | |____| |____ / ____ \ ____) | |___| |__| | |__| | |____ ',
            \'     \/   |______|______/_/    \_\_____/ \_____\____/|_____/|______|',
            \'                                     ______                         ',
            \'                                    |______|                        ',
            \]
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1


    call pathogen#incubate()
    filetype off
    syntax on
    filetype plugin indent on
    "
" Pathogen install
    "let g:pathogen_disabled = []
    "call add(g:pathogen_disabled, 'vim-markdown')
    "call add(g:pathogen_disabled, 'nerdcommenter')
    "call add(g:pathogen_disabled, 'vim-fugitive')
    "call add(g:pathogen_disabled, 'taglist')
    "call pathogen#incubate('bundle/{}')
    "call pathogen#helptags()
    "execute pathogen#infect()
    "filetype off
    "syntax on
    "filetype plugin indent on

" Basics
    set nocompatible                        " Use defauts Vim
    "syntax on
    "filetype plugin indent on
    set clipboard=unnamed                   " y/p copy to mac clipboard https://evertpot.com/osx-tmux-vim-copy-paste-clipboard/

    set mouse=a                             " Enable selection of VIM text with mouse. To past the selected text on MAC OS use `"*y`. 
                                            " Double click on VIM link is possible with this option activated.

" Encoding
    set ff=unix                             " Unix EOL
    set fileencoding=UTF-8                  " Speak UTF-8
    set encoding=UTF-8                      " Display UTF-8

" Color
    let php_sql_query = 1                   " SQL queries
    let php_htmlInStrings = 1               " HTML
    colorscheme solarized                   " Enable solarized vim theme
    "set t_Co=256                           " Usefull for MacOS or
    set t_Co=16                             " Usefull for gnome
    if has('gui_running')
        set guifont=Monospace\ 8
        let g:solarized_style="light"
        let g:solarized_contrast="high"
    endif

" UI
    set cursorline                          " Highlight the current line
    set scrolloff=8                         " Keep x line for scope while scrolling
    set sidescrolloff=8                     " same same
    set showmatch                           " Show matching bracket
    set number                              " Show line numbers in gutter
    set ruler                               " Always show current position along the bottom
    set showcmd                             " Show the command being typed
    set wildmode=list:longest               " Complete files like a shell.

" Statusline
    if has('statusline')
        set laststatus=2

        set statusline=%<%f\                    " Filename
        set statusline+=%w%h%m%r                " Options
    "    set statusline+=%{fugitive#statusline()} "  Git Hotness
        set statusline+=\ [%{&ff}/%Y]           " Show filetype in statusline
        set statusline+=\ [%{getcwd()}]          " current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

" Editor
    set bs=indent,eol,start                 " Backspace works everywhere
    set ruler                               " Show current cursor position
    set history=50                          " command history size
    set noerrorbells                        " Stop the noise!!
    set list
    set listchars=trail:¤,tab:>-            " Show blank spaces and tabs at the end of a line

" Search
    set incsearch                           " Highlight matches as you type.
    set hlsearch                            " Highlight matches.
    set ignorecase                          " Case-insensitive searching.
    set smartcase                           " But case-sensitive if expression contains a capital letter.

" Indentation
    set autoindent                          " Automatic indentation
    set softtabstop=4                       " tab = 4 space
    set shiftwidth=4
    set expandtab                           " no more tabs, only spaces!
    set shiftround                          " when at 3 spaces, and I hit > ... go to 4, not 7

" Keymap
    " Changing leader
    let mapleader   = ","
    let g:mapleader = ","

    " Navigate between buffers with "TAB"
    nnoremap <Tab> :bnext<CR>

    " With insert mode only
    "map user completion with Control-g (usefull to have autocompletion on services and routes)
    imap <C-g> <C-x><C-u>

    " Delete trailing spaces
    nmap <silent> <C-F10> :%s/\s\+$//g<CR>
    nmap <silent> <C-S-F10> :%s/^\s\+$//g<CR>

    " Insert php namespace
    nmap <silent> <C-F9> <ESC>"%PdF/r;:s#/#\\#g<CR>Inamespace  <ESC>d/[A-Z]
    " Insert php namespace and create class name
    nmap <silent> <C-S-F9> ggO<?php<CR><CR><ESC>"%PdF/r;:s#/#\\#g<CR>Inamespace  <ESC>d/[A-Z]<CR>Goclass <C-R>=expand("%:t:r")<CR><CR>{<CR>

    nnoremap <F2> :set nonu! \| NERDTreeToggle<CR>
    nnoremap <F3> :TlistToggle<CR>

" TypeScript tsuquyomi

    let g:tsuquyomi_completion_detail = 1 " Display signature detail instead of only accessor name
    let g:tsuquyomi_shortest_import_path = 1 " Use the shortest path for :TsuImport

    "on ',h' get property/method definition
    autocmd FileType typescript nmap <Leader>h :echo tsuquyomi#hint()<CR>
    "on ',i' Import the class under cursor
    autocmd FileType typescript nmap <Leader>i :TsuImport<CR>
    "on ',g' Import the class under cursor
    autocmd FileType typescript nmap <Leader>g :TsuDefinition<CR>

" NERDTree
    let g:NERDTreeWinPos = "right"

" Ack
    let g:ackprg="ack -H --nocolor --nogroup --column" "Only for Debian/Ubuntu were name is not ack

" Command-t
    " Without the bellow key binding in tmux, the command-t does not work properly when key-down is pressed
    " Tip from http://superuser.com/a/238164
    map <Esc>[B <Down>
    set wildignore+=app/cache/**,build/**       " Ignore generated files by symfony+vendor directory
    set wildignore+=.git/**                     " Ignore SCM folders
    "let g:CommandTFileScanner="find"            " Use native find command instead of ruby, faster on large projects

" MiniBufXplorer settings
    let g:miniBufExplMaxSize=2              " set max size to 2 lines
    let g:miniBufExplMapWindowNavVim= 1     " Navigate trough buffers with Control + [hjkl]
    let g:miniBufExplMapWindowNavArrows=1   " Navigate trough buffers with Control + Arrow Keys
    let g:miniBufExplMapCTabSwitchBufs=1    " Navigate trough buffers with <C-TAB> and <C-S-TAB>
    let g:miniBufExplModSelTarget=1         " Hide others explorers out of MBE
    let g:miniBufExplSplitBelow=0           " Put new window above current or on the left for vertical split
    " Minibufexpl with ,q is better than :Bclose :)
    noremap <leader>q :Bclose<CR>
    noremap <leader>q! :Bclose!<CR>

" TagList settings
    let Tlist_Auto_Open=0
    let Tlist_Use_Right_Window=0
    let Tlist_Sort_Type = "name" " order by
    let tlist_php_settings = 'php;c:class;d:constant;f:function' " don't show variables in php

" PDV
    let g:pdv_cfg_Author = "Olivier Dolbeau <contact@odolbeau.fr>"
    let g:pdv_cfg_Version = ""
    nnoremap <leader>d :call PhpDocSingle()<CR>
    vnoremap <leader>d :call PhpDocRange()<CR>

" filetype
    autocmd BufRead *.twig set filetype=htmltwig.html
    autocmd BufRead *.phps set filetype=php
    autocmd BufRead *.phpd set filetype=php
    autocmd BufNewFile,BufRead *.less set filetype=less
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Makefile
"    autocmd FileType make set noexpandtab

" UltiSnip
    "let g:UltiSnipsExpandTrigger="<tab>"
    "let g:UltiSnipsJumpForwardTrigger="<c-b>"
    "let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Snipmate
    let g:snips_author = "Joseph Rouff <rouffj@gmail.com>"
    let g:snipMate = {}
    let g:snipMate.scope_aliases = {}
    let g:snipMate.scope_aliases['php'] = 'php'     " Load php snippets only instead of php/html/javascript

" Autocompletion
    "filetype plugin on
    set omnifunc=syntaxcomplete#Complete

" use :W to force save when forgot to open file in root
    command W w !sudo tee % > /dev/null

" macros
    let @t='d/publicO/** **/�ku {}�kl@inheritDoc/);A�kb{}�kr:w�kb�kb'

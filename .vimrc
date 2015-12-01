" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/system-configs/.vim'
let &runtimepath.=','.vimDir


execute pathogen#infect()

set nu
set nowrap
set hlsearch
syntax on
set autoindent
"set ts=4
set shiftwidth=4
set softtabstop=4
set tabstop=8
set expandtab
filetype on
filetype plugin on
filetype plugin indent on

augroup filetypedetect
    au! BufRead,BufNewFile *.orogen setfiletype ruby 
    au! BufRead,BufNewFile *.page :set tw=80 
    au! BufRead,BufNewFile COMMIT_EDITMSG :set tw=72
augroup END

"set viminfo='10,\"100,:20,%,n~/.viminfo
":set viminfo?
:set viminfo='10000,<10000,s1000,h

augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

augroup END

syntax enable
"set background=dark
"colorscheme solarized
"
"
:highlight ExtraWhitespace ctermbg=lightgray guibg=lightgray

:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=gray guibg=gray

:match ExtraWhitespace /\s\+$/
:match ExtraWhitespace /\s\+$\| \+\ze\t/
:match ExtraWhitespace /[^\t]\zs\t\+/
"Whitespace before text
"Whitespace before text
":match ExtraWhitespace /^\t*\zs \+/

:match Comment /^%.*$/

:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

"Ruby completition
execute pathogen#infect()

syntax on
filetype plugin indent on

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

let g:ycm_confirm_extra_conf = 0
let g:ycm_always_populate_location_list = 1

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

set nobackup
set noswapfile

" clang-format
let g:clang_format#style_options = {
    \ "BasedOnStyle" : "Google",
    \ "IndentWidth" : "4",
    \ "Standard" : "C++11",
    \ "ColumnLimit" : "200",
    \ "BreakBeforeBraces" : "Linux",
    \ "BreakConstructorInitializersBeforeComma" : "true",
    \ "ConstructorInitializerAllOnOneLineOrOnePerLine" : "false"
    \ }

let g:clang_format#command = "clang-format-3.4"
let g:clang_format#detect_style_file = 1
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)

nnoremap <F5> :YcmDiags<CR>
let g:ycm_error_symbol = 'E'
let g:ycm_warning_symbol = 'w'
nnoremap <C-h> :YcmCompleter GoToImprecise<CR>
"Ctrl-o go backward
"ctrl-i go forward

let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
"au FileType xml exe ":silent %!xmllint --format --recover - 2>/dev/null"

"vim folding
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl set foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR
nnoremap <Space> za

"Fast replace shortcut
:nnoremap ' :%s/\<<C-r><C-w>\>//g<Left><Left>

let c_space_errors = 1
color desert


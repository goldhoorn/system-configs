"Other latex suff

"Enable spellchecking
set spell 
set spelllang=de
execute"set spellfile=".vimDir."/spell/de.utf-8.add"

let g:tex_flavor='latex'
set iskeyword+=:
set grepprg=grep\ -nH\ $*

filetype plugin on
filetype indent on
au BufEnter *.tex set autowrite
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_CompileRule_pdf = 'mkdir -p out && pdflatex -output-directory=out -interaction=nonstopmode $* && mv out/$*.pdf .'
let g:Tex_GotoError = 0
let g:Tex_ViewRule_pdf = 'evince'

"Remap key a so switch word case
nnoremap a mklb~`kh 

"Remaps for spell checking
nnoremap <C-c> z=
nnoremap <C-d> ]s 
nnoremap <C-a> /%WEITER%<CR>

set tw=80
set formatoptions+=w 
"nnoremap <C-f> gggqG "Buggy remap, causes errors in equations sometimes,don't use

"disable tex-vim plugin stuff, it annoys
let g:Tex_SmartKeyBS = 0
let g:Tex_SmartKeyQuote = 0
let g:Tex_SmartKeyDot = 0
let g:Imap_UsePlaceHolder = 0
let g:Tex_Leader = '`tex'
let g:Tex_Leader2 = ',tex'

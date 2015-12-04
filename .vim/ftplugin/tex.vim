"Other latex suff

"Enable spellchecking
set spell 
set spelllang=de
execute"set spellfile=".vimDir."/spell/de.utf-8.add"


filetype plugin on
filetype indent on
au BufEnter *.tex set autowrite
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_CompileRule_pdf = 'mkdir -p out && pdflatex -output-directory=out -interaction=nonstopmode $* && mv out/$*.pdf .'
let g:Tex_GotoError = 0
let g:Tex_ViewRule_pdf = 'evince'

"Remap key a so switch word case
nnoremap a mkb~`kh 

"Remaps for spell checking
nnoremap <C-c> z=
nnoremap <C-x> ]s 

set tw=80
set formatoptions+=w 
nnoremap <C-f> gggqG

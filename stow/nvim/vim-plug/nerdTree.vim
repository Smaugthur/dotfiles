" NerdTree

" Close NerdTree windows when openning a file
let NERDTreeQuitOnOpen=1
" Show hidden files
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Vim syntax file
" Mindex files

if exists("b:current_syntax")
     finish
endif

let b:current_syntax = "mindex"

" thanks to http://www.vim.org/scripts/script.php?script_id=2047
syntax region Field01 matchgroup=Field01 start=+^\p+ end=+$+ contains=Field02 
syntax region Field02 matchgroup=Field02 start=+\t+ end=+$+ contains=Field03 contained keepend
syntax region Field03 matchgroup=Field03 start=+\t+ end=+$+ contained keepend
syntax match Comment "^#.*"

hi link Field01 Normal
hi link Field02 Keyword
hi link Field03 Underlined

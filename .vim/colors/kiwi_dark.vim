" Reset highlighting to the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "kiwi_dark"

hi Search term=reverse ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black

" vim: sw=2:

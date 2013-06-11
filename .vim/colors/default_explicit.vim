" Vim's default color scheme, as set in file vim7/src/syntax.c.
" Extracted by Chad Versace <chad@chad-versace.us>.

let colors_name = "default_explicit"

" -----------------------------------
" begin $VIMRUNTIME/color/default.vim
" I extracted this snippet from $VIMRUNTIME/color/default.vim
hi clear Normal
set background&
hi clear

if exists("syntax_on")
  syntax reset
endif
" end $VIMRUNTIME/color/default.vim
" -----------------------------------

" From highlight_init_both
hi ErrorMsg term=standout ctermbg=DarkRed ctermfg=White guibg=Red guifg=White
hi IncSearch term=reverse cterm=reverse gui=reverse
hi ModeMsg term=bold cterm=bold gui=bold
hi NonText term=bold ctermfg=Blue gui=bold guifg=Blue
hi StatusLine term=reverse,bold cterm=reverse,bold gui=reverse,bold
hi StatusLineNC term=reverse cterm=reverse gui=reverse
hi VertSplit term=reverse cterm=reverse gui=reverse
hi VisualNOS term=underline,bold cterm=underline,bold gui=underline,bold
hi DiffText term=reverse cterm=bold ctermbg=Red gui=bold guibg=Red
hi PmenuThumb cterm=reverse gui=reverse
hi PmenuSbar ctermbg=Grey guibg=Grey
hi TabLineSel term=bold cterm=bold gui=bold
hi TabLineFill term=reverse cterm=reverse gui=reverse
hi Cursor guibg=fg guifg=bg
hi lCursor guibg=fg guifg=bg " should be different, but what? (orig comment)

if (&background == "light")
  " From highlight_init_light
  hi Directory term=bold ctermfg=DarkBlue guifg=Blue
  hi LineNr term=underline ctermfg=Brown guifg=Brown
  hi MoreMsg term=bold ctermfg=DarkGreen gui=bold guifg=SeaGreen
  hi Question term=standout ctermfg=DarkGreen gui=bold guifg=SeaGreen
  hi Search term=reverse ctermbg=Yellow ctermfg=NONE guibg=Yellow guifg=NONE
  hi SpellBad term=reverse ctermbg=LightRed guisp=Red gui=undercurl
  hi SpellCap term=reverse ctermbg=LightBlue guisp=Blue gui=undercurl
  hi SpellRare term=reverse ctermbg=LightMagenta guisp=Magenta gui=undercurl
  hi SpellLocal term=underline ctermbg=Cyan guisp=DarkCyan gui=undercurl
  hi Pmenu ctermbg=LightMagenta guibg=LightMagenta
  hi PmenuSel ctermbg=LightGrey guibg=Grey
  hi SpecialKey term=bold ctermfg=DarkBlue guifg=Blue
  hi Title term=bold ctermfg=DarkMagenta gui=bold guifg=Magenta
  hi WarningMsg term=standout ctermfg=DarkRed guifg=Red
  hi WildMenu term=standout ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
  hi Folded term=standout ctermbg=Grey ctermfg=DarkBlue guibg=LightGrey guifg=DarkBlue
  hi FoldColumn term=standout ctermbg=Grey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue
  hi SignColumn term=standout ctermbg=Grey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue
  hi Visual term=reverse guibg=LightGrey
  hi DiffAdd term=bold ctermbg=LightBlue guibg=LightBlue
  hi DiffChange term=bold ctermbg=LightMagenta guibg=LightMagenta
  hi DiffDelete term=bold ctermfg=Blue ctermbg=LightCyan gui=bold guifg=Blue guibg=LightCyan
  hi TabLine term=underline cterm=underline ctermfg=black ctermbg=LightGrey gui=underline guibg=LightGrey
  hi CursorColumn term=reverse ctermbg=LightGrey guibg=Grey90
  hi CursorLine term=underline cterm=underline guibg=Grey90
  hi MatchParen term=reverse ctermbg=Cyan guibg=Cyan
  hi Normal gui=NONE
endif

if (&background == "dark")
  " From highligh_init_dark
  hi Directory term=bold ctermfg=LightCyan guifg=Cyan
  hi LineNr term=underline ctermfg=Yellow guifg=Yellow
  hi MoreMsg term=bold ctermfg=LightGreen gui=bold guifg=SeaGreen
  hi Question term=standout ctermfg=LightGreen gui=bold guifg=Green
  hi Search term=reverse ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
  hi SpecialKey term=bold ctermfg=LightBlue guifg=Cyan
  hi SpellBad term=reverse ctermbg=Red guisp=Red gui=undercurl
  hi SpellCap term=reverse ctermbg=Blue guisp=Blue gui=undercurl
  hi SpellRare term=reverse ctermbg=Magenta guisp=Magenta gui=undercurl
  hi SpellLocal term=underline ctermbg=Cyan guisp=Cyan gui=undercurl
  hi Pmenu ctermbg=Magenta guibg=Magenta
  hi PmenuSel ctermbg=DarkGrey guibg=DarkGrey
  hi Title term=bold ctermfg=LightMagenta gui=bold guifg=Magenta
  hi WarningMsg term=standout ctermfg=LightRed guifg=Red
  hi WildMenu term=standout ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
  hi Folded term=standout ctermbg=DarkGrey ctermfg=Cyan guibg=DarkGrey guifg=Cyan
  hi FoldColumn term=standout ctermbg=DarkGrey ctermfg=Cyan guibg=Grey guifg=Cyan
  hi SignColumn term=standout ctermbg=DarkGrey ctermfg=Cyan guibg=Grey guifg=Cyan
  hi Visual term=reverse guibg=DarkGrey
  hi DiffAdd term=bold ctermbg=DarkBlue guibg=DarkBlue
  hi DiffChange term=bold ctermbg=DarkMagenta guibg=DarkMagenta
  hi DiffDelete term=bold ctermfg=Blue ctermbg=DarkCyan gui=bold guifg=Blue guibg=DarkCyan
  hi TabLine term=underline cterm=underline ctermfg=white ctermbg=DarkGrey gui=underline guibg=DarkGrey
  hi CursorColumn term=reverse ctermbg=DarkGrey guibg=Grey40
  hi CursorLine term=underline cterm=underline guibg=Grey40
  hi MatchParen term=reverse ctermbg=DarkCyan guibg=DarkCyan
  hi Normal gui=NONE
endif

" vim: sw=2:

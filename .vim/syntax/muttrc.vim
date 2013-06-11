source /usr/share/vim/vim73/syntax/muttrc.vim

syn keyword muttrcVarStr contained skipwhite sidebar_new nextgroup=muttrcColor
syn keyword muttrcVarStr contained skipwhite nm_default_uri nm_hidden_tags sidebar_new sidebar_visible sidebar_width vfolder_format virtual_spoolfile nextgroup=muttrcSetStrAssignment,muttrcVPrefix,muttrcVarBool,muttrcVarQuad,muttrcVarNum,muttrcVarStr
syn keyword muttrcCommand sidebar-next sidebar-open sidebar-previous virtual-mailboxes
syn match muttrcFunction contained "\<\%(modify-labels\|modify-labels-then-hide\)\>"
syn match muttrcFunction contained "\<sidebar-\%(next\|open\|prev\)\>"

syn match muttrcEmail "[a-zA-Z0-9._-]*@[a-zA-Z0-9./-]\+"

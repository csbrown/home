function KiwiProjNotmuchC()
    set noet sw=4 ts=8
endfunction

autocmd BufNewFile,BufRead **/notmuch/**.{c,cpp,h,hpp} call KiwiProjNotmuchC()

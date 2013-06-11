function KiwiProjMesaC()
    set et sw=3 ts=8 sts=3
endfunction

autocmd BufNewFile,BufRead ~/**/mesa/**.{c,cpp,h,hpp,l,lpp,y,ypp} call KiwiProjMesaC()

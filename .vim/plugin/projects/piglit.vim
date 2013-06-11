function KiwiProjPiglitC()
    set noet sw=8 ts=8
endfunction

function KiwiProjPiglitPy()
    " PEP 8
    set et sw=4 ts=8
endfunction

autocmd BufNewFile,BufRead ~/**/piglit/**.{c,h,shader_test,vert,frag} call KiwiProjPiglitC()
autocmd BufNewFile,BufRead ~/**/piglit/**.py call KiwiProjPiglitPy()

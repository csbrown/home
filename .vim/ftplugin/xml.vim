function CiteRefEntry(title, vol)
    let @" = "<citerefentry><refentrytitle>" . a:title . "</refentrytitle><manvolnum>" . a:vol . "</manvolnum></citerefentry>"
    norma! p
endfunction

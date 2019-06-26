command! Fillup :call s:fillup()

function! s:fillup()
    let s:l1 = getline(line('.'))
    normal dd
    for s:item in split(@x, '\W')
        let s:new_var = substitute(s:item, '^\W*\(.\{-}\)\W*$', '\1', '')
        if len(s:new_var) > 0
            call append(line('.'), substitute(s:l1, "xxx", s:new_var, ""))
        endif
    endfor
endfunction 

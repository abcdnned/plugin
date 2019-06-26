command! Onemore :call s:onemore()

function! Fill(len, char)
    return map(range(a:len), a:char)
endfunction

function! s:onemore()
    let s:l1 = getline(line('.')-2)
    let s:l2 = getline(line('.')-1)
    let s:chars1 = split(s:l1, '\zs')
    let s:chars2 = split(s:l2, '\zs')
    let s:s1 = len(s:chars1)
    let s:s2 = len(s:chars2)
    let s:min = min([s:s1, s:s2])
    let s:i = 0
    let s:result = map(range(s:min), 0)
    echo s:result
    while s:i < s:min
        if s:chars1[s:i] == s:chars2[s:i]
            let s:result[s:i] = s:chars1[s:i]
        endif
        let s:i += 1
    endwhile
    call append(line('.'), join(s:result, ""))
endfunction 

command! -nargs=* Find :call s:search_java(<f-args>)

function! s:search_java(...)
    let cur_word = expand("<cword>")
    let type = 'java'
    if a:0 == 1
        let cur_word = a:1
    endif
    let cmd = 'find **/'.cur_word.'.'.type
    echo cmd
    exe cmd
endfunction 

command! NewField :call s:newfield()

function! s:newfield()
    let s:l = getline('.')
    let s:str = matchstr(s:l, '\a\+')
    let s:var = tolower(s:str[0]).s:str[1:]
    call setline(line('.'), printf("    %s %s = new %s();", s:str, s:var, s:str))
    normal =k
endfunction

command! -nargs=* ConvertField :call s:convert(<f-args>)

function! s:convert(...)
    let s:l = getline('.')
    let s:str = matchstr(s:l, '\a\+')
    let s:var = tolower(s:str[0]).s:str[1:]
    call setline(line('.'), printf("    %s %s = (%s)%s;", s:str, s:var, s:str, a:1))
    normal =k
endfunction 

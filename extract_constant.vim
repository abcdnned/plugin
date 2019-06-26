command! -range ExtractString <line1>,<line2>call s:method()

function! s:method() range
    for line_number in range(a:firstline, a:lastline)
        let s:l = getline(line_number)
        "search for strings that need to be extracted
        let s:str = matchstr(s:l, '"\w\+"')
        "convert it to uppercase
        let s:up = toupper(s:str[1:len(s:str)-2])
        exe '%s/'.s:str.'/'.s:up.'/'
        call append(line('$') - 1, '    private static final String '.s:up.' = '.s:str.';')
        call append(line('$') - 2, '')
    endfor
endfunction


command! -nargs=* ExtractInt :call s:extractint(<f-args>)

function! s:extractint(...)
    let s:l = getline('.')
    let s:str = matchstr(s:l, '\d\+')
    exe 's/'.s:str.'/'.a:1.'/'
    call append(line('$') - 1, '    private static final int '.a:1.' = '.s:str.';')
    call append(line('$') - 2, '')
endfunction 

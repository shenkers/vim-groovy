function! GroovyComplete()
    let line = getline('.')

ruby << EOF
    require 'json'
    require 'socket'

    line = VIM::evaluate('line')

    hostname = 'localhost'
    port = 9999

    s = TCPSocket.open(hostname, port)
    s.puts line
    response = s.gets
    s.close

    json = JSON.parse(response)
    puts json

    VIM::command("let candidates = #{json['candidates']}")
    VIM::command("let logs = #{json['logs']}")
EOF

    if !empty(candidates)
        inoremap <buffer> <tab> <c-n>

        augroup _GroovyComplete
            autocmd!
            autocmd CursorMovedI,InsertLeave * iunmap <buffer> <tab>
                  \| autocmd! _GroovyComplete
        augroup END

        let prefix = matchstr(strpart(getline('.'), 0, col('.') - 1), '[a-zA-Z0-9_/-]*$')

        call complete(col('.') - strchars(prefix), candidates)
    endif

    return ''
endfunction

augroup GroovyComplete
    autocmd!
    autocmd FileType groovy inoremap <tab> <c-r>=GroovyComplete()<cr>
augroup END

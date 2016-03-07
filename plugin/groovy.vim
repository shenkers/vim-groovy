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
    autocmd FileType groovy call StartGroovyCompleterService()
augroup END

" Get the vim-groovy/plugin directory
let s:plugin_dir = expand('<sfile>:p:h')
let s:service_path = 'GroovyCompleterService.groovy'
let s:tmux_session_name = 'groovy_completer'

function! StartGroovyCompleterService()
    let s:start_cmd = 'tmux new -s "' . s:tmux_session_name . '" -c "' . s:plugin_dir . '" -d "groovy ' . s:service_path .'"'
    echo s:start_cmd
    call system(s:start_cmd)
endfunction

function! IsGroovyCompleterServiceRunning()
    let s:cmd = 'tmux ls | grep ' . s:tmux_session_name
    let sessions = system(s:cmd)
    let running = sessions =~# s:tmux_session_name
    echo 'Running: ' . running
    return running
endfunction

function! StopGroovyCompleterService()
    let s:cmd = 'tmux kill-session -t ' . s:tmux_session_name
    call system(s:cmd)
endfunction

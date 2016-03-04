" groovy.vim

function! Complete()
    let prefix = matchstr(strpart(getline('.'), 0, col('.') - 1), '[.a-zA-Z0-9_/-]*$')
    echo 'Completing "' . prefix . '"'

ruby << EOF
puts 'Calling groovy for candidates'
EOF

    echo 'Returned from searching candidates'

    " if !empty(candidates)
    " endif

endfunction

" inoremap <leader>p <ESC>:call Complete()<CR>
" nnoremap <leader>p <ESC>:call Complete()<CR>
"
" require 'json'
" require 'open-uri'

" term = VIM::evaluate('prefix')
" candidates = Thread.new do
"     puts "acquiring candidates"
"     url = "http://localhost:9999"
"     data = open(url).read
"     json = JSON.parse(data, symbolize_names: true)

"     puts json
" end

" VIM::command("let candidates = #{JSON.dump candidates}")

let b:vimpipe_command="node"

" remap section movement [[ ]] [] ][ for javascript
" { must be the last character on the line 
noremap <script> <buffer> <silent> [[ <nop>
noremap <script> <buffer> <silent> ]] <nop>

noremap <script> <buffer> <silent> [] <nop>
noremap <script> <buffer> <silent> ][ <nop>
function! s:NextSection(type, backwards)

    if a:type == 1
        let pattern = '\v^\S.*\=.*\{\s*$'
    elseif a:type == 2
        let pattern = '\v^\S.*:.*\{\s*$'
    endif

    if a:backwards
        let dir = '?'
    else
        let dir = '/'
    endif

    execute 'silent! normal! ' . dir . pattern . "\r"
endfunction

noremap <script> <buffer> <silent> ]]
        \ :call <SID>NextSection(1, 0)<cr>

noremap <script> <buffer> <silent> [[
        \ :call <SID>NextSection(1, 1)<cr>

noremap <script> <buffer> <silent> ][
        \ :call <SID>NextSection(2, 0)<cr>

noremap <script> <buffer> <silent> []
        \ :call <SID>NextSection(2, 1)<cr>

" clean up js to look like coffeescript
" doesn't quite work
" function! Js2cs()
  " %s/\t/\ \ /g
  " %s/\/\//#/g
  " %s/function/->/g
  " %s/,\n//g
  " %s/{//g
  " %s/}//g
  " %s/)/\ /g
  " %s/(/\ /g
  " %s/;\n//g
  " %s/var\ //g
  " %s/this\./@/g
  " %s/this/@/g
  " %s/\n\n\n//g
  " %s/\n\n\n//g
  " %s/\n\n\n//g
" endfunc




" toggle '# ' on the current line / selection (python only)
" ctrl-/ is delivered as <C-_> by most terminals
function! s:ToggleComment() range
  if getline(a:firstline) =~ '^\s*#'
    execute a:firstline . ',' . a:lastline . 's/^\(\s*\)# \?/\1/e'
  else
    execute a:firstline . ',' . a:lastline . 's/^\(\s*\)/\1# /e'
  endif
  nohlsearch
endfunction
autocmd FileType python nnoremap <buffer> <C-_> :call <SID>ToggleComment()<CR>
autocmd FileType python xnoremap <buffer> <C-_> :call <SID>ToggleComment()<CR>

function! test#php#artisan#test_file(file) abort
  return a:file =~# '\v(^|/)tests(/|\\)'
endfunction

function! test#php#artisan#build_position(type, position) abort
  return test#php#phpunit#build_position(a:type, a:position)
endfunction

function! test#php#artisan#build_args(args) abort
  let l:filtered = filter(copy(a:args), 'v:val !~# "^--colors\\(=\\)\\?$"')
  " call add(l:filtered)

  return l:filtered
endfunction

function! test#php#artisan#executable() abort
  return 'supa test'
endfunction

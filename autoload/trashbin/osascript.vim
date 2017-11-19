" https://apple.stackexchange.com/a/162354/255654
function! trashbin#osascript#delete(path) abort
  let script = 'tell app "Finder" to move the POSIX file "%s" to trash'
  let abspath = fnamemodify(expand(a:path), ':p')
  echo system(printf('osascript -e ''%s''', printf(script, abspath)))
  return v:shell_error
endfunction

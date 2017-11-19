if has('mac') && executable('osascript')
  function! trashbin#delete(...) abort
    return call('trashbin#osascript#delete', a:000)
  endfunction
elseif (has('win32') || has('win64')) && executable('powershell')
  function! trashbin#delete(...) abort
    return call('trashbin#powershell#delete', a:000)
  endfunction
else
  function! trashbin#delete(...) abort
    return call('trashbin#freedesktop#delete', a:000)
  endfunction
endif

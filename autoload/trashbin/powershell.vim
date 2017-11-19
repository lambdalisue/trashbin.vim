function! trashbin#powershell#delete(path) abort
    let abspath = fnamemodify(expand(a:path), ':p:gs?/?\\?')
    let script = [
          \ printf('$path = \"%s\"', abspath),
          \ '$shell = new-object -comobject \"Shell.Application\"',
          \ '$item = $shell.Namespace(0).ParseName(\"$path\")',
          \ '$item.InvokeVerb(\"delete\")',
          \]
    echo system(printf(
          \ 'powershell -ExecutionPolicy Bypass -Command "%s"',
          \ join(script, "\r\n"))
          \)
    return v:shell_error
endfunction

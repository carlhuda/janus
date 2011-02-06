"============================================================================
"File:        sass.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Martin Grenfell <martin.grenfell at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================
if exists("loaded_sass_syntax_checker")
    finish
endif
let loaded_sass_syntax_checker = 1

"bail if the user doesnt have the sass binary installed
if !executable("sass")
    finish
endif

function! SyntaxCheckers_sass_GetLocList()
    let makeprg='sass --check '.shellescape(expand('%'))
    let errorformat = '%Wwarning on line %l:,%Z%m,Syntax %trror on line %l: %m'
    let loclist = SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })

    let bn = bufnr("")
    for i in loclist
        let i['bufnr'] = bn
    endfor

    return loclist
endfunction

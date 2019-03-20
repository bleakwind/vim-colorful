" vim: set expandtab tabstop=4 softtabstop=4 shiftwidth=4: */
"
" +----------------------------------------------------------------------+
" | $Id: javascript.vim 2018-04-06 14:28:29Z Bleakwind $                 |
" +----------------------------------------------------------------------+
" | Copyright (c) 2008-2018 Bleakwind(Rick Woo).                         |
" +----------------------------------------------------------------------+
" | This source file is javascript.vim.                                  |
" | This source file is release under BSD license.                       |
" +----------------------------------------------------------------------+
" | Author: Bleakwind(Rick Woo) <bleakwind@gmail.com>                    |
" +----------------------------------------------------------------------+
"

function! s:DetectFiletype()
    if getline(1) =~# '^#!.*/bin/\(env\s\+\)\?node\>'
        setfiletype javascript
    endif
endfunction

autocmd BufNewFile,BufRead *.{js,es,es6} setfiletype javascript
autocmd BufNewFile,BufRead * call s:DetectFiletype()

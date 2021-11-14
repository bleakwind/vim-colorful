" vim: set expandtab tabstop=4 softtabstop=4 shiftwidth=4: */
"
" +--------------------------------------------------------------------------+
" | $Id: javascript.vim 2018-10-18 10:06:29 Bleakwind Exp $                  |
" +--------------------------------------------------------------------------+
" | Copyright (c) 2008-2018 Bleakwind(Rick Wu).                              |
" +--------------------------------------------------------------------------+
" | This source file is javascript.vim.                                      |
" | This source file is release under BSD license.                           |
" +--------------------------------------------------------------------------+
" | Author: Bleakwind(Rick Wu) <bleakwind@qq.com>                            |
" +--------------------------------------------------------------------------+
"

function! s:DetectFiletype()
    if getline(1) =~ '\v^\#\!.*\/bin\/env\s+node.*$\C'
        setfiletype javascript
    endif
endfunction

autocmd BufNewFile,BufRead *.{js,es,es6} setfiletype javascript
autocmd BufNewFile,BufRead * call s:DetectFiletype()

" vim: set expandtab tabstop=4 softtabstop=4 shiftwidth=4: */
"
" +--------------------------------------------------------------------------+
" | $Id: nginx.vim 2018-10-18 10:06:29 Bleakwind Exp $                       |
" +--------------------------------------------------------------------------+
" | Copyright (c) 2008-2018 Bleakwind(Rick Wu).                              |
" +--------------------------------------------------------------------------+
" | This source file is nginx.vim.                                           |
" | This source file is release under BSD license.                           |
" +--------------------------------------------------------------------------+
" | Author: Bleakwind(Rick Wu) <bleakwind@qq.com>                            |
" +--------------------------------------------------------------------------+
"

autocmd BufNewFile,BufRead *.{nginx,conf,ssl} setfiletype nginx

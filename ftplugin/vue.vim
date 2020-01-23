" vim: set expandtab tabstop=4 softtabstop=4 shiftwidth=4: */
"
" +----------------------------------------------------------------------+
" | $Id: vue.vim 2018-04-06 14:28:29Z Bleakwind $                        |
" +----------------------------------------------------------------------+
" | Copyright (c) 2008-2018 Bleakwind(Rick Woo).                         |
" +----------------------------------------------------------------------+
" | This source file is vue.vim.                                         |
" | This source file is release under BSD license.                       |
" +----------------------------------------------------------------------+
" | Author: Bleakwind(Rick Woo) <bleakwind@gmail.com>                    |
" +----------------------------------------------------------------------+
"

if exists('b:did_ftplugin')
  finish
endif

runtime! ftplugin/html.vim

setlocal suffixesadd+=.vue

if !exists('g:no_plugin_maps') && !exists('g:no_vue_maps')
  nnoremap <silent> <buffer> [[ :call search('^<\(template\<Bar>script\<Bar>style\)', 'bW')<CR>
  nnoremap <silent> <buffer> ]] :call search('^<\(template\<Bar>script\<Bar>style\)', 'W')<CR>
  nnoremap <silent> <buffer> [] :call search('^</\(template\<Bar>script\<Bar>style\)', 'bW')<CR>
  nnoremap <silent> <buffer> ][ :call search('^</\(template\<Bar>script\<Bar>style\)', 'W')<CR>
endif


" vim: set expandtab tabstop=4 softtabstop=4 shiftwidth=4: */
"
" +----------------------------------------------------------------------+
" | $Id: text.vim 2018-04-06 14:28:29Z Bleakwind $                       |
" +----------------------------------------------------------------------+
" | Copyright (c) 2008-2018 Bleakwind(Rick Woo).                         |
" +----------------------------------------------------------------------+
" | This source file is text.vim.                                        |
" | This source file is release under BSD license.                       |
" +----------------------------------------------------------------------+
" | Author: Bleakwind(Rick Woo) <bleakwind@gmail.com>                    |
" +----------------------------------------------------------------------+
"

if !exists("main_syntax")
    if exists("b:current_syntax")
        finish
    endif
    let main_syntax = 'text'
elseif exists("b:current_syntax") && b:current_syntax == "text"
  finish
endif
syntax sync fromstart

let s:cpo_save = &cpo
set cpo&vim

"******************************************************************************
" Color match: text
"******************************************************************************
syn match textDelimiterTop      '\v^\s*[\#]+\s*$\c'
syn match textDelimiterMiddle   '\v^\s*[\*]+\s*$\c'
syn match textDelimiterBottom   '\v^\s*[\-]+\s*$\c'
syn match textDelimiterRemark   '\v^\s*[\+]+\s*$\c'
syn match textTitleItem         '\v^\s*\=\=\=\>\s+.*\s*$\c'
syn match textTitleCommand      '\v^\s*\#\s+.*\s*$\c'
syn match textTitleComment      '\v^\s*\>\>\s+.*\s*$\c'
syn match textContentItem         '\v^\s*\=\>\s+.*\s*$\c'

"******************************************************************************
" Color detail: text
"******************************************************************************
hi link textDelimiterTop                Statement
hi link textDelimiterMiddle             Function
hi link textDelimiterBottom             Function
hi link textDelimiterRemark             Function
hi link textTitleItem                   Function
hi link textTitleCommand                Identifier
hi link textTitleComment                Comment
hi link textContentItem                 Function

let b:current_syntax = "text"
if main_syntax == 'text'
    unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

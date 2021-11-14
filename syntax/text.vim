" vim: set expandtab tabstop=4 softtabstop=4 shiftwidth=4: */
"
" +--------------------------------------------------------------------------+
" | $Id: text.vim 2018-10-18 10:06:29 Bleakwind Exp $                        |
" +--------------------------------------------------------------------------+
" | Copyright (c) 2008-2018 Bleakwind(Rick Wu).                              |
" +--------------------------------------------------------------------------+
" | This source file is text.vim.                                            |
" | This source file is release under BSD license.                           |
" +--------------------------------------------------------------------------+
" | Author: Bleakwind(Rick Wu) <bleakwind@qq.com>                            |
" +--------------------------------------------------------------------------+
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

" ============================================================================
" Color match: text
" ============================================================================
syn match textDelimiterTop              '\v^\s*[\#]+\s*$\c'
syn match textDelimiterSpecial          '\v^\s*[\*]+\s*$\c'
syn match textDelimiterSubject          '\v^\s*[\=]+\s*$\c'
syn match textDelimiterList             '\v^\s*[\-]+\s*$\c'
syn match textDelimiterRemark           '\v^\s*[\+]+\s*$\c'
syn match textDelimiterSublist          '\v^\s*[\~]+\s*$\c'

syn match textTitleSubject              '\v^\s*\=\=\=\>\>\>\s+.*\s*$\c'
syn match textTitleItem                 '\v^\s*\=\=\=\>\s+.*\s*$\c'
syn match textTitleList                 '\v^\s*\=\>\s+.*\s*$\c'
syn match textTitleEnd                  '\v^\s*\#\#\#\s+.*\s*\#\#\#$\c'

syn match textContentCommand            '\v^\s*[\#\%]\s+.*\s*$\c'
syn match textContentComment            '\v^\s*\>\>\s+.*\s*$\c'


" After textContentCommand
syn match textTitleCopyright            '\v^\s*\#\s[\|\+].*[\|\+]\s\#$\c'

" ============================================================================
" Color detail: text
" ============================================================================
hi link textDelimiterTop                Statement
hi link textDelimiterSpecial            Function
hi link textDelimiterSubject            Function
hi link textDelimiterList               Identifier
hi link textDelimiterRemark             Identifier
hi link textDelimiterSublist            Identifier

hi link textTitleSubject                Statement
hi link textTitleItem                   Function
hi link textTitleList                   Identifier
hi link textTitleEnd                    Statement

hi link textContentCommand              Identifier
hi link textContentComment              Comment

hi link textTitleCopyright              Statement

let b:current_syntax = "text"
if main_syntax == 'text'
    unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

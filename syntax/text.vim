"  vim: set expandtab tabstop=4 softtabstop=4 shiftwidth=4: */
"
"  +-------------------------------------------------------------------------+
"  | $Id: text.vim 2026-04-01 20:04:14 Bleakwind Exp $                       |
"  +-------------------------------------------------------------------------+
"  | Copyright (c) 2008-2026 Bleakwind(Rick Wu).                             |
"  +-------------------------------------------------------------------------+
"  | This source file is text.vim.                                           |
"  | This source file is release under BSD license.                          |
"  +-------------------------------------------------------------------------+
"  | Author: Bleakwind(Rick Wu) <bleakwind@qq.com>                           |
"  +-------------------------------------------------------------------------+
"

" ============================================================================
" Prevent loading twice and support syntax nesting
" ============================================================================
if !exists('main_syntax')
    if exists('b:current_syntax')
        finish
    endif
    let main_syntax = 'text'
elseif exists('b:current_syntax') && b:current_syntax == "text"
  finish
endif
syntax sync fromstart

let s:cpo_save = &cpo
set cpo&vim

" ============================================================================
" Inlcude other syntax file
" ============================================================================
runtime! syntax/html.vim

if exists('b:current_syntax')
    unlet b:current_syntax
endif

" ============================================================================
" Syntax definition
" ============================================================================
syn match textDelimiterTop              '\v^\s*[\#]+[\s\n\r]*$\c'
syn match textDelimiterSubject          '\v^\s*([\*]+|[\=]+)[\s\n\r]*$\c'
syn match textDelimiterList             '\v^\s*[\-]+[\s\n\r]*$\c'
syn match textDelimiterRemark           '\v^\s*[\~]+[\s\n\r]*$\c'

syn match textTitleTop                  '\v^\s*\=\=\=\>\>\>\s+.*[\s\n\r]*$\c'
syn match textTitleSubject              '\v^\s*\=\=\=\>\s+.*[\s\n\r]*$\c'
syn match textTitleList                 '\v^\s*\=\>\s+.*[\s\n\r]*$\c'
syn match textTitleRemark               '\v^\s*\-\>\s+.*[\s\n\r]*$\c'

syn match textContentCommand            '\v^\s*[\#\$\%][\s\n\r]*$\c'
syn match textContentCommand            '\v^\s*[\#\$\%]\s+.*[\s\n\r]*$\c'

syn match textContentComment            '\v^\s*\>\>\s+.*[\s\n\r]*$\c'

" After textContentCommand
syn match textTitleCopyright            '\v^\s*\#\s[\|\+].*[\|\+]\s\#$\c'
syn match textTitleCopyright            '\v^\s*[\#]+\n\s*\#\s[\|\+].*[\|\+]\s\#$\c'
syn match textTitleCopyright            '\v^\s*\#\s[\|\+].*[\|\+]\s\#\n\s*[\#]+$\c'

" ============================================================================
" Color setting
" ============================================================================
hi link textDelimiterTop                String
hi link textDelimiterSubject            Statement
hi link textDelimiterList               Function
hi link textDelimiterRemark             Comment

hi link textTitleTop                    String
hi link textTitleSubject                Statement
hi link textTitleList                   Function
hi link textTitleRemark                 Comment

hi link textContentCommand              Identifier
hi link textContentComment              Comment

hi link textTitleCopyright              Statement

" ============================================================================
" Remove global variable and cleanup
" ============================================================================
let b:current_syntax = "text"
if exists('main_syntax') && main_syntax == 'text'
    unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save


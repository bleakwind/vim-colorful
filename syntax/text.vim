"  vim: set expandtab tabstop=4 softtabstop=4 shiftwidth=4: */
"
"  +-------------------------------------------------------------------------+
"  | $Id: text.vim 2026-04-02 04:23:51 Bleakwind Exp $                       |
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

syn match textContentData               '\v^\s*\>\s+.*[\s\n\r]*$\c'

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
hi text_normal                          ctermfg=White       ctermbg=NONE        cterm=NONE        guifg=#DDDDDD   guibg=NONE      gui=NONE
hi text_structures                      ctermfg=LightGreen  ctermbg=NONE        cterm=NONE        guifg=#A3D97D   guibg=NONE      gui=NONE
hi text_functions                       ctermfg=DarkCyan    ctermbg=NONE        cterm=NONE        guifg=#44B3B3   guibg=NONE      gui=NONE
hi text_variables                       ctermfg=LightBlue   ctermbg=NONE        cterm=NONE        guifg=#92BDE8   guibg=NONE      gui=NONE
hi text_string                          ctermfg=LightRed    ctermbg=NONE        cterm=NONE        guifg=#FF939C   guibg=NONE      gui=NONE
hi text_comment                         ctermfg=DarkGray    ctermbg=NONE        cterm=NONE        guifg=#ABB2BF   guibg=NONE      gui=NONE
hi text_value                           ctermfg=Brown       ctermbg=NONE        cterm=NONE        guifg=#E09E40   guibg=NONE      gui=NONE
hi text_error                           ctermfg=White       ctermbg=DarkMagenta cterm=NONE        guifg=#FFFFFF   guibg=#AE508D   gui=NONE
hi text_nothing                         ctermfg=NONE        ctermbg=NONE        cterm=NONE        guifg=NONE      guibg=NONE      gui=NONE
hi text_unknown                         ctermfg=Black       ctermbg=Yellow      cterm=NONE        guifg=Black     guibg=Yellow    gui=NONE

hi link textDelimiterTop                text_string
hi link textDelimiterSubject            text_structures
hi link textDelimiterList               text_functions
hi link textDelimiterRemark             text_comment

hi link textTitleTop                    text_string
hi link textTitleSubject                text_structures
hi link textTitleList                   text_functions
hi link textTitleRemark                 text_comment

hi link textContentData                 text_normal

hi link textContentCommand              text_variables
hi link textContentComment              text_comment

hi link textTitleCopyright              text_structures

" ============================================================================
" Remove global variable and cleanup
" ============================================================================
let b:current_syntax = "text"
if exists('main_syntax') && main_syntax == 'text'
    unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save


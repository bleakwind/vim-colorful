"  vim: set expandtab tabstop=4 softtabstop=4 shiftwidth=4: */
"
"  +-------------------------------------------------------------------------+
"  | $Id: javascript.vim 2026-04-02 04:05:22 Bleakwind Exp $                 |
"  +-------------------------------------------------------------------------+
"  | Copyright (c) 2008-2026 Bleakwind(Rick Wu).                             |
"  +-------------------------------------------------------------------------+
"  | This source file is javascript.vim.                                     |
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
    let main_syntax = 'javascript'
elseif exists('b:current_syntax') && b:current_syntax == "javascript"
  finish
endif
syntax sync fromstart

let s:cpo_save = &cpo
set cpo&vim

" ============================================================================
" Inlcude other syntax file
" ============================================================================
let s:syntax_sys = $VIMRUNTIME . '/syntax/javascript.vim'
if filereadable(s:syntax_sys) | execute 'source' s:syntax_sys | endif | unlet s:syntax_sys

if exists('b:current_syntax')
    unlet b:current_syntax
endif

" ============================================================================
" Syntax definition
" ============================================================================
" ...

" ============================================================================
" Color setting
" ============================================================================
hi javascript_normal                    ctermfg=White       ctermbg=NONE        cterm=NONE        guifg=#DDDDDD   guibg=NONE      gui=NONE
hi javascript_structures                ctermfg=LightGreen  ctermbg=NONE        cterm=NONE        guifg=#A3D97D   guibg=NONE      gui=NONE
hi javascript_functions                 ctermfg=DarkCyan    ctermbg=NONE        cterm=NONE        guifg=#44B3B3   guibg=NONE      gui=NONE
hi javascript_variables                 ctermfg=LightBlue   ctermbg=NONE        cterm=NONE        guifg=#92BDE8   guibg=NONE      gui=NONE
hi javascript_string                    ctermfg=LightRed    ctermbg=NONE        cterm=NONE        guifg=#FF939C   guibg=NONE      gui=NONE
hi javascript_comment                   ctermfg=DarkGray    ctermbg=NONE        cterm=NONE        guifg=#ABB2BF   guibg=NONE      gui=NONE
hi javascript_value                     ctermfg=Brown       ctermbg=NONE        cterm=NONE        guifg=#E09E40   guibg=NONE      gui=NONE
hi javascript_error                     ctermfg=White       ctermbg=DarkMagenta cterm=NONE        guifg=#FFFFFF   guibg=#AE508D   gui=NONE
hi javascript_nothing                   ctermfg=NONE        ctermbg=NONE        cterm=NONE        guifg=NONE      guibg=NONE      gui=NONE
hi javascript_unknown                   ctermfg=Black       ctermbg=Yellow      cterm=NONE        guifg=Black     guibg=Yellow    gui=NONE

hi link javaScriptCommand               javascript_unknown
hi link javaScriptComment               javascript_comment
hi link javaScriptLineComment           javascript_comment
hi link javaScriptCommentTodo           javascript_structures
hi link javaScriptSpecial               javascript_string
hi link javaScriptStringS               javascript_string
hi link javaScriptStringD               javascript_string
hi link javaScriptCharacter             javascript_unknown
hi link javaScriptSpecialCharacter      javascript_unknown
hi link javaScriptNumber                javascript_variables
hi link javaScriptConditional           javascript_structures
hi link javaScriptRepeat                javascript_structures
hi link javaScriptBranch                javascript_unknown
hi link javaScriptOperator              javascript_structures
hi link javaScriptType                  javascript_functions
hi link javaScriptStatement             javascript_structures
hi link javaScriptFunction              javascript_structures
hi link javaScriptBraces                javascript_structures
hi link javaScriptError                 javascript_error
hi link javaScriptNull                  javascript_variables
hi link javaScriptBoolean               javascript_variables
hi link javaScriptRegexpString          javascript_string
hi link javaScriptIdentifier            javascript_functions
hi link javaScriptLabel                 javascript_structures
hi link javaScriptException             javascript_structures
hi link javaScriptMessage               javascript_structures
hi link javaScriptGlobal                javascript_structures
hi link javaScriptMember                javascript_structures
hi link javaScriptDeprecated            javascript_variables
hi link javaScriptReserved              javascript_structures
hi link javaScriptDebug                 javascript_unknown
hi link javaScriptConstant              javascript_unknown

" ============================================================================
" Remove global variable and cleanup
" ============================================================================
let b:current_syntax = "javascript"
if exists('main_syntax') && main_syntax == 'javascript'
    unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save


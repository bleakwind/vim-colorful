" vim: set expandtab tabstop=4 softtabstop=4 shiftwidth=4: */
"
" +--------------------------------------------------------------------------+
" | $Id: c.vim 2018-10-18 10:06:29 Bleakwind Exp $                           |
" +--------------------------------------------------------------------------+
" | Copyright (c) 2008-2018 Bleakwind(Rick Wu).                              |
" +--------------------------------------------------------------------------+
" | This source file is c.vim.                                               |
" | This source file is release under BSD license.                           |
" +--------------------------------------------------------------------------+
" | Author: Bleakwind(Rick Wu) <bleakwind@qq.com>                            |
" +--------------------------------------------------------------------------+
"

if !exists('main_syntax')
    if exists('b:current_syntax')
        finish
    endif
    let main_syntax = 'c'
elseif exists('b:current_syntax') && b:current_syntax == "c"
  finish
endif
syntax sync fromstart

let s:cpo_save = &cpo
set cpo&vim

runtime! $VIMRUNTIME/syntax/c.vim
if exists('b:current_syntax')
    unlet b:current_syntax
endif

" ============================================================================
" Color match: C
" ============================================================================
syn match cVariables                    '\v[\*]*\s*<\h\w*>\s*[\[\=\;\:\,\&\|\!\?\+\-\*\/\)\]]\c'me=e-1
syn match cVariables                    '\v^[\*]*\s*<\h\w*>\s*[\,\n]\c'ms=s+1,me=e-1
syn match cVariables                    '\v\;[\*]*\s*<\h\w*>\s*[\,\n]\c'ms=s+1,me=e-1
syn match cOperator                     '\v[\}]*(\s)*<\h\w*>(\s|\n)*[\{]\c'me=e-1
syn match cOperator                     '\v[\}]+(\s)*<\h\w*>(\s)*[\(]\c'me=e-1
syn match cOperator                     '\v^(\s)*<\h\w*>(\s|\n)+(\h|\*)\c'me=e-1
syn match cOperator                     '\v\;(\s)*<\h\w*>(\s|\n)+(\h|\*)\c'ms=s+1,me=e-1
syn match cOperator                     '\v(<\h\w*>\.)+\c'
syn match cOperator                     '\v(\<\<|\>\>|\&\&|\|\||\+\+|\-\-|\-\>)\c'
"syn match cDelimiter                    '\v[\(\)\[\]\<\>\&\*\;\+\-\=]\c'
"syn match cDelimiter                    '\v[\(\)]+\c' contained
"syn match cPointer                      '\v[\*]+\c' contained
"syn match cFunctions                    '\v(\*\(|\*)*<\h\w*>(\s|\n)*\(\c' contains=cPointer,cDelimiter
syn match cFunctions                    '\v(\*\(|\*)*<\h\w*>(\s|\n)*\)(\s|\n)*\(\c' contains=cPointer,cDelimiter
syn match cBraces display               '\v[\{\}]\c'

" ============================================================================
" Color detail: C
" ============================================================================
hi c_structures                         ctermfg=LightGreen  ctermbg=NONE        cterm=NONE        guifg=#A3D97D   guibg=NONE      gui=NONE
hi c_functions                          ctermfg=DarkCyan    ctermbg=NONE        cterm=NONE        guifg=#44B3B3   guibg=NONE      gui=NONE
hi c_variables                          ctermfg=LightBlue   ctermbg=NONE        cterm=NONE        guifg=#92BDE8   guibg=NONE      gui=NONE
hi c_string                             ctermfg=LightRed    ctermbg=NONE        cterm=NONE        guifg=#FF939C   guibg=NONE      gui=NONE
hi c_comment                            ctermfg=DarkGray    ctermbg=NONE        cterm=NONE        guifg=#ABB2BF   guibg=NONE      gui=NONE
hi c_error                              ctermfg=White       ctermbg=DarkMagenta cterm=NONE        guifg=#FFFFFF   guibg=#AE508D   gui=NONE
hi c_nothing                            ctermfg=NONE        ctermbg=NONE        cterm=NONE        guifg=NONE      guibg=NONE      gui=NONE
hi c_unknown                            ctermfg=Black       ctermbg=Yellow      cterm=NONE        guifg=Black     guibg=Yellow    gui=NONE
hi link cBadBlock                       c_unknown
hi link cBadContinuation                c_unknown
hi link cBitField                       c_unknown
hi link cBlock                          c_unknown
hi link cBracket                        c_unknown
hi link cCharacter                      c_string
hi link cComment                        c_comment
hi link cComment2String                 c_comment
hi link cCommentError                   c_error
hi link cCommentGroup                   c_comment
hi link cCommentL                       c_comment
hi link cCommentSkip                    c_comment
hi link cCommentStart                   c_comment
hi link cCommentStartError              c_error
hi link cCommentString                  c_comment
hi link cConditional                    c_structures
hi link cConstant                       c_variables
hi link cCppBracket                     c_unknown
hi link cCppInElse                      c_unknown
hi link cCppInElse2                     c_unknown
hi link cCppInIf                        c_unknown
hi link cCppInSkip                      c_unknown
hi link cCppInWrapper                   c_unknown
hi link cCppOut                         c_unknown
hi link cCppOutElse                     c_unknown
hi link cCppOutIf                       c_unknown
hi link cCppOutIf2                      c_unknown
hi link cCppOutInGroup                  c_unknown
hi link cCppOutSkip                     c_unknown
hi link cCppOutWrapper                  c_unknown
hi link cCppParen                       c_unknown
hi link cCppSkip                        c_unknown
hi link cCppString                      c_string
hi link cCsSpn                          c_unknown
hi link cCurlyError                     c_error
hi link cDefine                         c_functions
hi link cErrInBracket                   c_unknown
hi link cErrInParen                     c_unknown
hi link cError                          c_error
hi link cFloat                          c_variables
hi link cFormat                         c_variables
hi link cInclude                        c_functions
hi link cIncluded                       c_string
hi link cLabel                          c_structures
hi link cLabelGroup                     c_unknown
hi link cLineSkip                       c_unknown
hi link cMulti                          c_unknown
hi link cMultiGroup                     c_unknown
hi link cNumber                         c_variables
hi link cNumbers                        c_variables
hi link cNumbersCom                     c_variables
hi link cOctal                          c_variables
hi link cOctalError                     c_error
hi link cOctalZero                      c_variables
hi link cOperator                       c_structures
hi link cParen                          c_unknown
hi link cParenError                     c_error
hi link cParenGroup                     c_unknown
hi link cPreCondit                      c_structures
hi link cPreConditMatch                 c_structures
hi link cPreProc                        c_unknown
hi link cPreProcGroup                   c_unknown
hi link cRepeat                         c_structures
hi link cSpaceError                     c_error
hi link cSpecial                        c_string
hi link cSpecialCharacter               c_string
hi link cSpecialError                   c_error
hi link cStatement                      c_structures
hi link cStorageClass                   c_structures
hi link cString                         c_string
hi link cStringGroup                    c_string
hi link cStructure                      c_structures
hi link cTodo                           c_structures
hi link cType                           c_structures
hi link cUserCont                       c_nothing
hi link cUserLabel                      c_structures

hi link cVariables                      c_variables
hi link cOperator                       c_structures
hi link cDelimiter                      c_structures
hi link cPointer                        c_structures
hi link cFunctions                      c_functions
hi link cBraces                         c_structures

"let b:current_syntax = "c"
if main_syntax == 'c'
    unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

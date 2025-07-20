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
" Color match: Javascript
" ============================================================================
syntax match javaScriptCommand "^#!.*"

syn keyword javaScriptCommentTodo       TODO FIXME XXX TBD contained
syn match   javaScriptLineComment       "\/\/.*" contains=@Spell,javaScriptCommentTodo
syn match   javaScriptCommentSkip       "^[ \t]*\*\($\|[ \t]\+\)"
syn region  javaScriptComment           start="/\*"  end="\*/" contains=@Spell,javaScriptCommentTodo
syn match   javaScriptSpecial           "\\\d\d\d\|\\."
syn region  javaScriptStringD           start=+"+  skip=+\\\\\|\\"+  end=+"\|$+  contains=javaScriptSpecial,@htmlPreproc
syn region  javaScriptStringS           start=+'+  skip=+\\\\\|\\'+  end=+'\|$+  contains=javaScriptSpecial,@htmlPreproc

syn match   javaScriptSpecialCharacter  "'\\.'"
syn match   javaScriptNumber            "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn region  javaScriptRegexpString      start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gim]\{0,2\}\s*$+ end=+/[gim]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline

syn keyword javaScriptConditional       if else switch
syn keyword javaScriptRepeat            while for do in
syn keyword javaScriptBranch            break continue
syn keyword javaScriptOperator          new delete instanceof typeof
syn keyword javaScriptType              Array Boolean Date Function Number Object String RegExp
syn keyword javaScriptStatement         return with
syn keyword javaScriptBoolean           true false
syn keyword javaScriptNull              null undefined
syn keyword javaScriptIdentifier        arguments this var let
syn keyword javaScriptLabel             case default
syn keyword javaScriptException         try catch finally throw
syn keyword javaScriptMessage           alert confirm prompt status
syn keyword javaScriptGlobal            self window top parent
syn keyword javaScriptMember            document event location
syn keyword javaScriptDeprecated        escape unescape
syn keyword javaScriptReserved          abstract boolean byte char class const debugger double enum export extends final float goto implements import int interface long native package private protected public short static super synchronized throws transient volatile

if exists('javaScript_fold')
    syn match   javaScriptFunction      "\<function\>"
    syn region  javaScriptFunctionFold  start="\<function\>.*[^};]$" end="^\z1}.*$" transparent fold keepend

    syn sync match javaScriptSync       grouphere javaScriptFunctionFold "\<function\>"
    syn sync match javaScriptSync       grouphere NONE "^}"

    setlocal foldmethod=syntax
    setlocal foldtext=getline(v:foldstart)
else
    syn keyword javaScriptFunction  function
    syn match   javaScriptBraces        "[{}\[\]]"
    syn match   javaScriptParens        "[()]"
endif

syn sync fromstart
syn sync maxlines=100

if main_syntax == "javascript"
  syn sync ccomment javaScriptComment
endif

" ============================================================================
" Color detail: Javascript
" ============================================================================
hi javascript_structures                ctermfg=LightGreen  ctermbg=NONE        cterm=NONE        guifg=#A3D97D   guibg=NONE      gui=NONE
hi javascript_functions                 ctermfg=DarkCyan    ctermbg=NONE        cterm=NONE        guifg=#44B3B3   guibg=NONE      gui=NONE
hi javascript_variables                 ctermfg=LightBlue   ctermbg=NONE        cterm=NONE        guifg=#92BDE8   guibg=NONE      gui=NONE
hi javascript_string                    ctermfg=LightRed    ctermbg=NONE        cterm=NONE        guifg=#FF939C   guibg=NONE      gui=NONE
hi javascript_comment                   ctermfg=DarkGray    ctermbg=NONE        cterm=NONE        guifg=#ABB2BF   guibg=NONE      gui=NONE
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

let b:current_syntax = "javascript"
if main_syntax == 'javascript'
    unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

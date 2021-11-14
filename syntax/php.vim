" vim: set expandtab tabstop=4 softtabstop=4 shiftwidth=4: */
"
" +--------------------------------------------------------------------------+
" | $Id: php.vim 2018-10-18 10:06:29 Bleakwind Exp $                         |
" +--------------------------------------------------------------------------+
" | Copyright (c) 2008-2018 Bleakwind(Rick Wu).                              |
" +--------------------------------------------------------------------------+
" | This source file is php.vim.                                             |
" | This source file is release under BSD license.                           |
" +--------------------------------------------------------------------------+
" | Author: Bleakwind(Rick Wu) <bleakwind@qq.com>                            |
" +--------------------------------------------------------------------------+
"

if !exists("main_syntax")
    if exists("b:current_syntax")
        finish
    endif
    let main_syntax = 'php'
elseif exists("b:current_syntax") && b:current_syntax == "php"
  finish
endif
syntax sync fromstart

let s:cpo_save = &cpo
set cpo&vim

runtime! $VIMRUNTIME/syntax/php.vim
if exists("b:current_syntax")
    unlet b:current_syntax
endif

" ============================================================================
" Color detail: PHP
" ============================================================================
hi link phpAddStrings                   String
hi link phpAssignByRef                  Operator
hi link phpBackslashDoubleQuote         String
hi link phpBackslashSequences           String
hi link phpBackslashSingleQuote         String
hi link phpBacktick                     String
hi link phpBaselib                      Function
hi link phpBoolean                      Boolean
hi link phpBrackets                     Delimiter
hi link phpClasses                      Function
hi link phpComment                      Comment
hi link phpComparison                   Operator
hi link phpConditional                  Conditional
hi link phpConstant                     Constant
hi link phpCoreConstant                 Constant
hi link phpDefine                       Statement
hi link phpDocCustomTags                SpecialComment
hi link phpDocTags                      SpecialComment
hi link phpDocTodo                      SpecialComment
hi link phpEnvVar                       Identifier
hi link phpException                    Exception
hi link phpFCKeyword                    Keyword
hi link phpFloat                        Float
hi link phpFunctions                    Function
hi link phpHereDoc                      String
hi link phpIdentifier                   Identifier
hi link phpIdentifierConst              Identifier
hi link phpIdentifierSimply             Identifier
hi link phpInclude                      Include
hi link phpInterfaces                   Function
hi link phpInterpBogusDollarCurley      String
hi link phpInterpDollarCurley1Helper    String
hi link phpInterpDollarCurley2Helper    String
hi link phpInterpDollarCurly1           String
hi link phpInterpDollarCurly2           String
hi link phpInterpDouble                 String
hi link phpInterpMethodName             String
hi link phpInterpSimple                 String
hi link phpInterpSimpleBrackets         String
hi link phpInterpSimpleBracketsInner    String
hi link phpInterpSimpleCurly            String
hi link phpInterpSimpleError            Error
hi link phpInterpVarname                String
hi link phpIntVar                       Identifier
hi link phpKeyword                      Keyword
hi link phpLabel                        Label
hi link phpMemberSelector               Operator
hi link phpMethods                      Function
hi link phpMethodsVar                   Identifier
hi link phpNowDoc                       String
hi link phpNumber                       Number
hi link phpOctalError                   Error
hi link phpOperator                     Operator
hi link phpParent                       Delimiter
hi link phpParentError                  Error
hi link phpRegion                       Function
hi link phpRegionAsp                    Function
hi link phpRegionSc                     Function
hi link phpRegionSync                   Function
hi link phpRelation                     Operator
hi link phpRepeat                       Repeat
hi link phpSCKeyword                    Keyword
hi link phpSpecialFunction              Structure
hi link phpStatement                    Statement
hi link phpStorageClass                 StorageClass
hi link phpStringDouble                 String
hi link phpStringSingle                 String
hi link phpStructure                    Statement
hi link phpTodo                         Todo
hi link phpType                         Type
hi link phpVarSelector                  Identifier

"let b:current_syntax = "php"
if main_syntax == 'php'
    unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

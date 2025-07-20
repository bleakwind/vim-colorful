" vim: set expandtab tabstop=4 softtabstop=4 shiftwidth=4: */
"
" +--------------------------------------------------------------------------+
" | $Id: markdown.vim 2025-06-03 15:15:10 Bleakwind Exp $                    |
" +--------------------------------------------------------------------------+
" | Copyright (c) 2008-2025 Bleakwind(Rick Wu).                              |
" +--------------------------------------------------------------------------+
" | This source file is markdown.vim.                                        |
" | This source file is release under BSD license.                           |
" +--------------------------------------------------------------------------+
" | Author: Bleakwind(Rick Wu) <bleakwind@qq.com>                            |
" +--------------------------------------------------------------------------+
"

if !exists('main_syntax')
    if exists('b:current_syntax')
        finish
    endif
    let main_syntax = 'markdown'
elseif exists('b:current_syntax') && b:current_syntax == "markdown"
  finish
endif
syntax sync fromstart

let s:cpo_save = &cpo
set cpo&vim

runtime! $VIMRUNTIME/syntax/markdown.vim
if exists('b:current_syntax')
    unlet b:current_syntax
endif

" ============================================================================
" Color detail: Markdown
" ============================================================================
hi link markdownH1                    htmlH1
hi link markdownH2                    htmlH2
hi link markdownH3                    htmlH3
hi link markdownH4                    htmlH4
hi link markdownH5                    htmlH5
hi link markdownH6                    htmlH6
hi link markdownHeadingRule           markdownRule
hi link markdownH1Delimiter           markdownHeadingDelimiter
hi link markdownH2Delimiter           markdownHeadingDelimiter
hi link markdownH3Delimiter           markdownHeadingDelimiter
hi link markdownH4Delimiter           markdownHeadingDelimiter
hi link markdownH5Delimiter           markdownHeadingDelimiter
hi link markdownH6Delimiter           markdownHeadingDelimiter
hi link markdownHeadingDelimiter      Delimiter
hi link markdownOrderedListMarker     markdownListMarker
hi link markdownListMarker            htmlTagName
hi link markdownBlockquote            Comment
hi link markdownRule                  PreProc

hi link markdownFootnote              Typedef
hi link markdownFootnoteDefinition    Typedef

hi link markdownLinkText              htmlLink
hi link markdownIdDeclaration         Typedef
hi link markdownId                    Type
hi link markdownAutomaticLink         markdownUrl
hi link markdownUrl                   Float
hi link markdownUrlTitle              String
hi link markdownIdDelimiter           markdownLinkDelimiter
hi link markdownUrlDelimiter          htmlTag
hi link markdownUrlTitleDelimiter     Delimiter

hi link markdownItalic                htmlItalic
hi link markdownItalicDelimiter       markdownItalic
hi link markdownBold                  htmlBold
hi link markdownBoldDelimiter         markdownBold
hi link markdownBoldItalic            htmlBoldItalic
hi link markdownBoldItalicDelimiter   markdownBoldItalic
hi link markdownStrike                htmlStrike
hi link markdownStrikeDelimiter       markdownStrike
hi link markdownCodeDelimiter         Delimiter

hi link markdownEscape                Special
hi link markdownError                 Error

"let b:current_syntax = "markdown"
if main_syntax == 'markdown'
    unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

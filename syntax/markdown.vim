"  vim: set expandtab tabstop=4 softtabstop=4 shiftwidth=4: */
"
"  +-------------------------------------------------------------------------+
"  | $Id: markdown.vim 2026-04-01 19:37:24 Bleakwind Exp $                   |
"  +-------------------------------------------------------------------------+
"  | Copyright (c) 2008-2026 Bleakwind(Rick Wu).                             |
"  +-------------------------------------------------------------------------+
"  | This source file is markdown.vim.                                       |
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
    let main_syntax = 'markdown'
elseif exists('b:current_syntax') && b:current_syntax == "markdown"
  finish
endif
syntax sync fromstart

let s:cpo_save = &cpo
set cpo&vim

" ============================================================================
" Inlcude other syntax file
" ============================================================================
let s:syntax_sys = $VIMRUNTIME . '/syntax/markdown.vim'
if filereadable(s:syntax_sys) | execute 'source' s:syntax_sys | endif | unlet s:syntax_sys

if exists('b:current_syntax')
    unlet b:current_syntax
endif

" ============================================================================
" Syntax definition
" ============================================================================
syn match markdownComment "^\s*\"\s*.*$" contains=@Spell containedin=ALL

" ============================================================================
" Color setting
" ============================================================================
hi def link markdownH1                      htmlH1
hi def link markdownH2                      htmlH2
hi def link markdownH3                      htmlH3
hi def link markdownH4                      htmlH4
hi def link markdownH5                      htmlH5
hi def link markdownH6                      htmlH6
hi def link markdownHeadingRule             markdownRule
hi def link markdownH1Delimiter             markdownHeadingDelimiter
hi def link markdownH2Delimiter             markdownHeadingDelimiter
hi def link markdownH3Delimiter             markdownHeadingDelimiter
hi def link markdownH4Delimiter             markdownHeadingDelimiter
hi def link markdownH5Delimiter             markdownHeadingDelimiter
hi def link markdownH6Delimiter             markdownHeadingDelimiter
hi def link markdownHeadingDelimiter        Delimiter
hi def link markdownOrderedListMarker       markdownListMarker
hi def link markdownListMarker              htmlTagName
hi def link markdownBlockquote              Comment
hi def link markdownRule                    PreProc

hi def link markdownFootnote                Typedef
hi def link markdownFootnoteDefinition      Typedef

hi def link markdownLinkText                htmlLink
hi def link markdownIdDeclaration           Typedef
hi def link markdownId                      Type
hi def link markdownAutomaticLink           markdownUrl
hi def link markdownUrl                     Float
hi def link markdownUrlTitle                String
hi def link markdownIdDelimiter             markdownLinkDelimiter
hi def link markdownUrlDelimiter            htmlTag
hi def link markdownUrlTitleDelimiter       Delimiter

hi def link markdownItalic                  htmlItalic
hi def link markdownItalicDelimiter         markdownItalic
hi def link markdownBold                    htmlBold
hi def link markdownBoldDelimiter           markdownBold
hi def link markdownBoldItalic              htmlBoldItalic
hi def link markdownBoldItalicDelimiter     markdownBoldItalic
hi def link markdownStrike                  htmlStrike
hi def link markdownStrikeDelimiter         markdownStrike
hi def link markdownCodeDelimiter           Delimiter

hi def link markdownEscape                  Special
hi def link markdownError                   Error

hi def link markdownComment                 Comment

" ============================================================================
" Remove global variable and cleanup
" ============================================================================
let b:current_syntax = "markdown"
if exists('main_syntax') && main_syntax == 'markdown'
    unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save


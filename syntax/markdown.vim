"  vim: set expandtab tabstop=4 softtabstop=4 shiftwidth=4: */
"
"  +-------------------------------------------------------------------------+
"  | $Id: markdown.vim 2026-03-29 17:17:21 Bleakwind Exp $                   |
"  +-------------------------------------------------------------------------+
"  | Copyright (c) 2008-2026 Bleakwind(Rick Wu).                             |
"  +-------------------------------------------------------------------------+
"  | This source file is markdown.vim.                                       |
"  | This source file is release under BSD license.                          |
"  +-------------------------------------------------------------------------+
"  | Author: Bleakwind(Rick Wu) <bleakwind@qq.com>                           |
"  +-------------------------------------------------------------------------+
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

" Save user settings
if has('folding')
  let s:save_foldmethod = &l:foldmethod
  let s:save_foldtext = &l:foldtext
endif
let s:save_iskeyword = &l:iskeyword

" ============================================================================
" Reuse HTML highlighting
" ============================================================================
runtime! syntax/html.vim
unlet! b:current_syntax

" ============================================================================
" Configure syntax sync
" ============================================================================
syn spell toplevel
if !exists('g:markdown_minlines')
  let g:markdown_minlines = 100
endif
execute 'syn sync minlines=' . g:markdown_minlines
syn sync linebreaks=1
syn case ignore

" Ignore mis-detected HTML/entities as valid characters
syn match markdownValid '[<>]\c[a-z/$!]\@!' transparent contains=NONE
syn match markdownValid '&\%(#\=\w*;\)\@!' transparent contains=NONE

" Define syntax clusters
syn cluster markdownBlock contains=markdownH1,markdownH2,markdownH3,markdownH4,markdownH5,markdownH6,markdownBlockquote,markdownListMarker,markdownOrderedListMarker,markdownCodeBlock,markdownRule
syn cluster markdownInline contains=markdownLineBreak,markdownLinkText,markdownItalic,markdownBold,markdownCode,markdownEscape,@htmlTop,markdownError,markdownValid

syn match markdownLineStart "^[<@]\@!" nextgroup=@markdownBlock,htmlSpecialChar

" Setext-style headers
syn match markdownH1 "^.\+\n=\+$" contained contains=@markdownInline,markdownHeadingRule,markdownAutomaticLink
syn match markdownH2 "^.\+\n-\+$" contained contains=@markdownInline,markdownHeadingRule,markdownAutomaticLink
syn match markdownHeadingRule "^[=-]\+$" contained

" Atx-style headers
syn region markdownH1 matchgroup=markdownH1Delimiter start=" \{,3}#\s"      end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
syn region markdownH2 matchgroup=markdownH2Delimiter start=" \{,3}##\s"     end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
syn region markdownH3 matchgroup=markdownH3Delimiter start=" \{,3}###\s"    end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
syn region markdownH4 matchgroup=markdownH4Delimiter start=" \{,3}####\s"   end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
syn region markdownH5 matchgroup=markdownH5Delimiter start=" \{,3}#####\s"  end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
syn region markdownH6 matchgroup=markdownH6Delimiter start=" \{,3}######\s" end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained

" Block
syn match markdownBlockquote ">\%(\s\|$\)" contained nextgroup=@markdownBlock
syn region markdownCodeBlock start="^\n\( \{4,}\|\t\)" end="^\ze \{,3}\S.*$" keepend

" Unordered list markers
syn match markdownListMarker "\%(\t\| \{0,4\}\)[-*+]\%(\s\+\S\)\@=" contained
syn match markdownOrderedListMarker "\%(\t\| \{0,4\}\)\<\d\+\.\%(\s\+\S\)\@=" contained

" Horizontal rules
syn match markdownRule "\* *\* *\*[ *]*$" contained
syn match markdownRule "- *- *-[ -]*$" contained

" Line breaks
syn match markdownLineBreak " \{2,\}$"

" Link definitions
syn region markdownIdDeclaration matchgroup=markdownLinkDelimiter start="^ \{0,3\}!\=\[" end="\]:" oneline keepend nextgroup=markdownUrl skipwhite
syn match markdownUrl "\S\+" nextgroup=markdownUrlTitle skipwhite contained
syn region markdownUrl matchgroup=markdownUrlDelimiter start="<" end=">" oneline keepend nextgroup=markdownUrlTitle skipwhite contained
syn region markdownUrlTitle matchgroup=markdownUrlTitleDelimiter start=+"+ end=+"+ keepend contained
syn region markdownUrlTitle matchgroup=markdownUrlTitleDelimiter start=+'+ end=+'+ keepend contained
syn region markdownUrlTitle matchgroup=markdownUrlTitleDelimiter start=+(+ end=+)+ keepend contained

" Link text and url
syn region markdownLinkText matchgroup=markdownLinkTextDelimiter start="!\=\[\%(\_[^][]*\%(\[\_[^][]*\]\_[^][]*\)*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@=" nextgroup=markdownLink,markdownId skipwhite contains=@markdownInline,markdownLineStart
syn region markdownLink matchgroup=markdownLinkDelimiter start="(" end=")" contains=markdownUrl keepend contained
syn region markdownId matchgroup=markdownIdDelimiter start="\[" end="\]" keepend contained

" Automatic links
syn region markdownAutomaticLink matchgroup=markdownUrlDelimiter start="<\%(\w\+:\|[[:alnum:]_+-]\+@\)\@=" end=">" keepend oneline

" Italic, bold, bold-italic, and strikethrough text
syn region markdownItalic matchgroup=markdownItalicDelimiter start="\*\S\@=" end="\S\@<=\*\|^$" skip="\\\*" contains=markdownLineStart,@Spell
syn region markdownItalic matchgroup=markdownItalicDelimiter start="\w\@<!_\S\@=" end="\S\@<=_\w\@!\|^$" skip="\\_" contains=markdownLineStart,@Spell
syn region markdownBold matchgroup=markdownBoldDelimiter start="\*\*\S\@=" end="\S\@<=\*\*\|^$" skip="\\\*" contains=markdownLineStart,markdownItalic,@Spell
syn region markdownBold matchgroup=markdownBoldDelimiter start="\w\@<!__\S\@=" end="\S\@<=__\w\@!\|^$" skip="\\_" contains=markdownLineStart,markdownItalic,@Spell
syn region markdownBoldItalic matchgroup=markdownBoldItalicDelimiter start="\*\*\*\S\@=" end="\S\@<=\*\*\*\|^$" skip="\\\*" contains=markdownLineStart,@Spell
syn region markdownBoldItalic matchgroup=markdownBoldItalicDelimiter start="\w\@<!___\S\@=" end="\S\@<=___\w\@!\|^$" skip="\\_" contains=markdownLineStart,@Spell
syn region markdownStrike matchgroup=markdownStrikeDelimiter start="\~\~\S\@=" end="\S\@<=\~\~\|^$" contains=markdownLineStart,@Spell

" Code
syn region markdownCode matchgroup=markdownCodeDelimiter start="`" end="`" keepend contains=markdownLineStart
syn region markdownCode matchgroup=markdownCodeDelimiter start="`` \=" end=" \=``" keepend contains=markdownLineStart
syn region markdownCodeBlock matchgroup=markdownCodeDelimiter start="^\s*\z(`\{3,\}\).*$" end="^\s*\z1\ze\s*$" keepend
syn region markdownCodeBlock matchgroup=markdownCodeDelimiter start="^\s*\z(\~\{3,\}\).*$" end="^\s*\z1\ze\s*$" keepend

" Footnotes
syn match markdownFootnote "\[^[^\]]\+\]"
syn match markdownFootnoteDefinition "^\[^[^\]]\+\]:"

" Escaped characters
syn match markdownEscape "\\[][\\`*_{}()<>#+.!-]"

" Comment lines
syn match markdownComment "^\s*\"\s*.*$" contains=@Spell containedin=ALL

" ============================================================================
" Highlight group definitions
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

" Restore user settings
if exists('s:save_foldmethod')
  let &l:foldmethod = s:save_foldmethod
  unlet s:save_foldmethod
endif
if exists('s:save_foldtext')
  let &l:foldtext = s:save_foldtext
  unlet s:save_foldtext
endif
if exists('s:save_iskeyword')
  let &l:iskeyword = s:save_iskeyword
  unlet s:save_iskeyword
endif

let b:current_syntax = "markdown"
if main_syntax == 'markdown'
    unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save


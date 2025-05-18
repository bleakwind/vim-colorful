" vim: set expandtab tabstop=4 softtabstop=4 shiftwidth=4: */
"
" +--------------------------------------------------------------------------+
" | $Id: html.vim 2018-10-18 10:06:29 Bleakwind Exp $                        |
" +--------------------------------------------------------------------------+
" | Copyright (c) 2008-2018 Bleakwind(Rick Wu).                              |
" +--------------------------------------------------------------------------+
" | This source file is html.vim.                                            |
" | This source file is release under BSD license.                           |
" +--------------------------------------------------------------------------+
" | Author: Bleakwind(Rick Wu) <bleakwind@qq.com>                            |
" +--------------------------------------------------------------------------+
"

if !exists("main_syntax")
    if exists("b:current_syntax")
        finish
    endif
    let main_syntax = 'html'
elseif exists("b:current_syntax") && b:current_syntax == "html"
  finish
endif
syntax sync fromstart

let s:cpo_save = &cpo
set cpo&vim

runtime! $VIMRUNTIME/syntax/html.vim
if exists("b:current_syntax")
    unlet b:current_syntax
endif

" ============================================================================
" Color detail: Html
" ============================================================================
hi html_normal                          ctermfg=White       ctermbg=Black       cterm=NONE        guifg=#DDDDDD   guibg=#282C34   gui=NONE
hi html_structures                      ctermfg=LightGreen  ctermbg=NONE        cterm=NONE        guifg=#C6E8AC   guibg=NONE      gui=NONE
hi html_functions                       ctermfg=DarkCyan    ctermbg=NONE        cterm=NONE        guifg=#74C9C9   guibg=NONE      gui=NONE
hi html_variables                       ctermfg=LightBlue   ctermbg=NONE        cterm=NONE        guifg=#AECEEE   guibg=NONE      gui=NONE
hi html_string                          ctermfg=LightRed    ctermbg=NONE        cterm=NONE        guifg=#FFB5BA   guibg=NONE      gui=NONE
hi html_comment                         ctermfg=DarkGray    ctermbg=NONE        cterm=NONE        guifg=#ABB2BF   guibg=NONE      gui=NONE
hi html_value                           ctermfg=Brown       ctermbg=NONE        cterm=NONE        guifg=#F8B551   guibg=NONE      gui=NONE
hi html_error                           ctermfg=White       ctermbg=DarkMagenta cterm=NONE        guifg=#FFFFFF   guibg=#AE508D   gui=NONE
hi html_nothing                         ctermfg=NONE        ctermbg=NONE        cterm=NONE        guifg=NONE      guibg=NONE      gui=NONE
hi html_unknown                         ctermfg=White       ctermbg=NONE        cterm=NONE        guifg=#DDDDDD   guibg=NONE      gui=NONE
hi link htmlNormal                      html_normal
hi link htmlArg                         html_variables
hi link htmlArgCluster                  html_unknown
hi link htmlBold                        html_value
hi link htmlBoldItalic                  html_value
hi link htmlBoldItalicUnderline         html_value
hi link htmlBoldUnderline               html_value
hi link htmlBoldUnderlineItalic         html_value
hi link htmlComment                     html_comment
hi link htmlCommentError                html_error
hi link htmlCommentPart                 html_comment
hi link htmlCss                         html_unknown
hi link htmlCssDefinition               html_unknown
hi link htmlCssStyleComment             html_comment
hi link htmlEndTag                      html_structures
hi link htmlError                       html_error
hi link htmlEvent                       html_functions
hi link htmlEventDQ                     html_variables
hi link htmlEventSQ                     html_variables
hi link htmlH1                          html_functions
hi link htmlH2                          html_functions
hi link htmlH3                          html_functions
hi link htmlH4                          html_functions
hi link htmlH5                          html_functions
hi link htmlH6                          html_functions
hi link htmlHead                        html_unknown
hi link htmlHighlight                   html_unknown
hi link htmlHighlightSkip               html_unknown
hi link htmlItalic                      html_value
hi link htmlItalicBold                  html_value
hi link htmlItalicBoldUnderline         html_value
hi link htmlItalicUnderline             html_value
hi link htmlItalicUnderlineBold         html_value
hi link htmlJavaScript                  html_unknown
hi link htmlLeadingSpace                html_nothing
hi link htmlLink                        html_value
hi link htmlPreAttr                     html_unknown
hi link htmlPreError                    html_error
hi link htmlPreProc                     html_unknown
hi link htmlPreProcAttrError            html_error
hi link htmlPreProcAttrName             html_unknown
hi link htmlPreStmt                     html_unknown
hi link htmlScriptTag                   html_structures
hi link htmlSpecial                     html_unknown
hi link htmlSpecialChar                 html_value
hi link htmlSpecialTagName              html_structures
hi link htmlStatement                   html_unknown
hi link htmlString                      html_string
hi link htmlStyleArg                    html_unknown
hi link htmlTag                         html_structures
hi link htmlTagError                    html_error
hi link htmlTagN                        html_structures
hi link htmlTagName                     html_structures
hi link htmlTagNameCluster              html_unknown
hi link htmlTitle                       html_value
hi link htmlTop                         html_unknown
hi link htmlUnderline                   html_value
hi link htmlUnderlineBold               html_value
hi link htmlUnderlineBoldItalic         html_value
hi link htmlUnderlineItalic             html_value
hi link htmlUnderlineItalicBold         html_value
hi link htmlValue                       html_string
hi link htmlVbScript                    html_unknown
"hi link javaScript                      html_variables
"hi link javaScriptExpression            html_variables

"let b:current_syntax = "html"
if main_syntax == 'html'
    unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: set expandtab tabstop=4 softtabstop=4 shiftwidth=4: */
"
" +--------------------------------------------------------------------------+
" | $Id: nginx.vim 2018-10-18 10:06:29 Bleakwind Exp $                       |
" +--------------------------------------------------------------------------+
" | Copyright (c) 2008-2018 Bleakwind(Rick Wu).                              |
" +--------------------------------------------------------------------------+
" | This source file is nginx.vim.                                           |
" | This source file is release under BSD license.                           |
" +--------------------------------------------------------------------------+
" | Author: Bleakwind(Rick Wu) <bleakwind@qq.com>                            |
" +--------------------------------------------------------------------------+
"

if !exists("main_syntax")
    if exists("b:current_syntax")
        finish
    endif
    let main_syntax = 'nginx'
elseif exists("b:current_syntax") && b:current_syntax == "nginx"
  finish
endif
syntax sync fromstart

let s:cpo_save = &cpo
set cpo&vim

runtime! $VIMRUNTIME/syntax/nginx.vim
if exists("b:current_syntax")
    unlet b:current_syntax
endif

" ============================================================================
" Color detail: Nginx
" ============================================================================
hi link ngxComment                      Comment
hi link ngxVariable                     Identifier
hi link ngxVariableBlock                Identifier
hi link ngxVariableString               PreProc
hi link ngxString                       String
hi link ngxIPaddr                       Delimiter
hi link ngxBoolean                      Boolean
hi link ngxInteger                      Number
hi link ngxDirectiveBlock               Statement
hi link ngxDirectiveImportant           Type
hi link ngxDirectiveControl             Keyword
hi link ngxDirectiveDeprecated          Error
hi link ngxDirective                    Function
hi link ngxDirectiveThirdParty          Function
hi link ngxListenOptions                PreProc
hi link ngxUpstreamServerOptions        PreProc
hi link ngxProxyNextUpstreamOptions     PreProc
hi link ngxMailProtocol                 Keyword
hi link ngxSSLProtocol                  PreProc
hi link ngxSSLProtocolDeprecated        Error
hi link ngxStickyOptions                ngxDirective
hi link ngxCookieOptions                PreProc
hi link ngxTemplateVar                  Identifier

hi link ngxSSLSessionTicketsOff         ngxBoolean
hi link ngxSSLSessionTicketsOn          Error
hi link ngxSSLPreferServerCiphersOn     ngxBoolean
hi link ngxSSLPreferServerCiphersOff    Error
hi link ngxGzipOff                      ngxBoolean
hi link ngxGzipOn                       Error
hi link ngxSSLCipherInsecure            Error

hi link ngxThirdPartyLuaBlock           Function

"let b:current_syntax = "nginx"
if main_syntax == 'nginx'
    unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save

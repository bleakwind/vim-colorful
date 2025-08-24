" vim: set expandtab tabstop=4 softtabstop=4 shiftwidth=4: */
"
" +--------------------------------------------------------------------------+
" | $Id: colorful.vim 2018-10-18 10:06:29 Bleakwind Exp $                    |
" +--------------------------------------------------------------------------+
" | Copyright (c) 2008-2018 Bleakwind(Rick Wu).                              |
" +--------------------------------------------------------------------------+
" | This source file is colorful.vim.                                        |
" | This source file is release under BSD license.                           |
" +--------------------------------------------------------------------------+
" | Author: Bleakwind(Rick Wu) <bleakwind@qq.com>                            |
" +--------------------------------------------------------------------------+
"

set background=dark

hi clear
let g:colors_name = 'colorful'

let s:t_Co = has('gui_running') ? -1 : (&t_Co ?? 0)

if (has('termguicolors') && &termguicolors) || has('gui_running')
    let g:terminal_ansi_colors = ['#171421', '#C01C28', '#26A269', '#A2734C', '#12488B', '#A347BA', '#2AA1B3', '#D0CFCC', '#5E5C64', '#F66151', '#33D17A', '#E9AD0C', '#2A7BDE', '#C061CB', '#33C7DE', '#FFFFFF']
endif

" ============================================================================
" Color detail
" ============================================================================
" ------------------------------------------------
" System
" ------------------------------------------------
hi Normal                           ctermfg=White       ctermbg=Black       cterm=NONE      guifg=#DDDDDD   guibg=#282C34   gui=NONE
hi LineNr                           ctermfg=Black       ctermbg=Gray        cterm=NONE      guifg=#59647A   guibg=#21252B   gui=NONE
hi LineNrAbove                      ctermfg=Black       ctermbg=Gray        cterm=NONE      guifg=#59647A   guibg=#21252B   gui=NONE
hi LineNrBelow                      ctermfg=Black       ctermbg=Gray        cterm=NONE      guifg=#59647A   guibg=#21252B   gui=NONE
hi CursorLine                       ctermfg=NONE        ctermbg=DarkGray    cterm=NONE      guifg=NONE      guibg=#2C323C   gui=NONE
hi CursorLineNr                     ctermfg=Black       ctermbg=DarkGray    cterm=NONE      guifg=#A1ACC4   guibg=#2C323C   gui=NONE
hi CursorLineFold                   ctermfg=Black       ctermbg=DarkGray    cterm=NONE      guifg=#A1ACC4   guibg=#2C323C   gui=NONE
hi CursorLineSign                   ctermfg=Black       ctermbg=DarkGray    cterm=NONE      guifg=#A1ACC4   guibg=#2C323C   gui=NONE
hi CursorColumn                     ctermfg=NONE        ctermbg=DarkGray    cterm=NONE      guifg=NONE      guibg=#2C323C   gui=NONE
hi Cursor                           ctermfg=Black       ctermbg=White       cterm=NONE      guifg=#000000   guibg=#FFFFFF   gui=NONE
hi CursorIM                         ctermfg=Black       ctermbg=LightGreen  cterm=NONE      guifg=#000000   guibg=#A3D97D   gui=NONE
hi lCursor                          ctermfg=Black       ctermbg=Blue        cterm=NONE      guifg=#000000   guibg=#6A5ACD   gui=NONE
hi ColorColumn                      ctermfg=NONE        ctermbg=DarkGray    cterm=NONE      guifg=NONE      guibg=#2C323C   gui=NONE
hi Folded                           ctermfg=Black       ctermbg=DarkGray    cterm=NONE      guifg=#A1ACC4   guibg=#21252B   gui=NONE
hi FoldColumn                       ctermfg=Black       ctermbg=DarkGray    cterm=NONE      guifg=#59647A   guibg=#1D2228   gui=NONE
hi SignColumn                       ctermfg=Red         ctermbg=DarkGray    cterm=NONE      guifg=#AE508D   guibg=#21252B   gui=NONE
hi StatusLine                       ctermfg=LightGray   ctermbg=Black       cterm=NONE      guifg=#59647A   guibg=#171C22   gui=NONE
hi StatusLineNC                     ctermfg=LightGray   ctermbg=Black       cterm=NONE      guifg=#59647A   guibg=#171C22   gui=NONE
hi StatusLineTerm                   ctermfg=LightGray   ctermbg=Black       cterm=NONE      guifg=#59647A   guibg=#171C22   gui=NONE
hi StatusLineTermNC                 ctermfg=LightGray   ctermbg=Black       cterm=NONE      guifg=#59647A   guibg=#171C22   gui=NONE
hi VertSplit                        ctermfg=Black       ctermbg=Black       cterm=NONE      guifg=#171C22   guibg=#171C22   gui=NONE
hi Directory                        ctermfg=LightBlue   ctermbg=NONE        cterm=NONE      guifg=#92BDE8   guibg=NONE      gui=NONE
hi Search                           ctermfg=White       ctermbg=DarkMagenta cterm=NONE      guifg=#FFFFFF   guibg=#AE508D   gui=NONE
hi IncSearch                        ctermfg=Black       ctermbg=Magenta     cterm=NONE      guifg=#000000   guibg=#FF939C   gui=NONE
hi CurSearch                        ctermfg=Black       ctermbg=Magenta     cterm=NONE      guifg=#000000   guibg=#FF939C   gui=NONE
hi Visual                           ctermfg=White       ctermbg=Blue        cterm=NONE      guifg=#FFFFFF   guibg=#6A5ACD   gui=NONE
hi VisualNOS                        ctermfg=White       ctermbg=Blue        cterm=Underline guifg=#FFFFFF   guibg=#6A5ACD   gui=Underline
hi SpecialKey                       ctermfg=Black       ctermbg=LightGreen  cterm=NONE      guifg=#000000   guibg=#A3D97D   gui=NONE
hi MatchParen                       ctermfg=Black       ctermbg=Cyan        cterm=NONE      guifg=#000000   guibg=#FF939C   gui=NONE
hi WildMenu                         ctermfg=Black       ctermbg=Magenta     cterm=NONE      guifg=#000000   guibg=#FF939C   gui=NONE
hi Conceal                          ctermfg=DarkGray    ctermbg=NONE        cterm=NONE      guifg=#A9A9A9   guibg=NONE      gui=NONE
hi NonText                          ctermfg=DarkGray    ctermbg=NONE        cterm=NONE      guifg=#A9A9A9   guibg=NONE      gui=NONE
hi EndOfBuffer                      ctermfg=DarkGray    ctermbg=NONE        cterm=NONE      guifg=#A9A9A9   guibg=NONE      gui=NONE
hi Title                            ctermfg=Green       ctermbg=NONE        cterm=NONE      guifg=#B3D97D   guibg=NONE      gui=NONE
hi ModeMsg                          ctermfg=LightBlue   ctermbg=NONE        cterm=Bold      guifg=#82BDE8   guibg=NONE      gui=Bold
hi MsgArea                          ctermfg=White       ctermbg=Black       cterm=NONE      guifg=#DDDDDD   guibg=#282C34   gui=NONE
hi MoreMsg                          ctermfg=LightBlue   ctermbg=NONE        cterm=Bold      guifg=#82BDE8   guibg=NONE      gui=Bold
hi Question                         ctermfg=LightBlue   ctermbg=NONE        cterm=Bold      guifg=#82BDE8   guibg=NONE      gui=Bold
hi QuickFixLine                     ctermfg=White       ctermbg=DarkMagenta cterm=NONE      guifg=#FFFFFF   guibg=#AE508D   gui=NONE
hi WarningMsg                       ctermfg=Yellow      ctermbg=NONE        cterm=Bold      guifg=#EEBE77   guibg=NONE      gui=Bold
hi ErrorMsg                         ctermfg=Red         ctermbg=NONE        cterm=Bold      guifg=#EF939C   guibg=NONE      gui=Bold
hi MessageWindow                    ctermfg=LightBlue   ctermbg=NONE        cterm=Bold      guifg=#82BDE8   guibg=NONE      gui=Bold
hi DiffAdd                          ctermfg=NONE        ctermbg=DarkGreen   cterm=NONE      guifg=NONE      guibg=#005E15   gui=NONE
hi DiffChange                       ctermfg=NONE        ctermbg=Brown       cterm=NONE      guifg=NONE      guibg=#834E00   gui=NONE
hi DiffDelete                       ctermfg=NONE        ctermbg=DarkGray    cterm=NONE      guifg=NONE      guibg=#4F4F4F   gui=NONE
hi DiffText                         ctermfg=NONE        ctermbg=DarkBlue    cterm=NONE      guifg=NONE      guibg=#1D2088   gui=NONE
hi Pmenu                            ctermfg=Black       ctermbg=LightGray   cterm=NONE      guifg=#000000   guibg=#A9A9A9   gui=NONE
hi PmenuMatch                       ctermfg=Black       ctermbg=LightGray   cterm=NONE      guifg=#000000   guibg=#A9A9A9   gui=NONE
hi PmenuKind                        ctermfg=Black       ctermbg=LightGray   cterm=NONE      guifg=#000000   guibg=#A9A9A9   gui=NONE
hi PmenuExtra                       ctermfg=Black       ctermbg=LightGray   cterm=NONE      guifg=#000000   guibg=#A9A9A9   gui=NONE
hi PmenuSbar                        ctermfg=Black       ctermbg=Gray        cterm=NONE      guifg=#000000   guibg=#59647A   gui=NONE
hi PmenuThumb                       ctermfg=Black       ctermbg=DarkGray    cterm=NONE      guifg=#000000   guibg=#4C525D   gui=NONE
hi PmenuSel                         ctermfg=White       ctermbg=DarkMagenta cterm=NONE      guifg=#FFFFFF   guibg=#AE508D   gui=NONE
hi PmenuMatchSel                    ctermfg=White       ctermbg=DarkMagenta cterm=NONE      guifg=#FFFFFF   guibg=#AE508D   gui=NONE
hi PmenuKindSel                     ctermfg=White       ctermbg=DarkMagenta cterm=NONE      guifg=#FFFFFF   guibg=#AE508D   gui=NONE
hi PmenuExtraSel                    ctermfg=White       ctermbg=DarkMagenta cterm=NONE      guifg=#FFFFFF   guibg=#AE508D   gui=NONE
hi ComplMatchIns                    ctermfg=White       ctermbg=DarkMagenta cterm=NONE      guifg=#FFFFFF   guibg=#AE508D   gui=NONE
hi PopupNotification                ctermfg=Black       ctermbg=LightGray   cterm=NONE      guifg=#000000   guibg=#A9A9A9   gui=NONE
hi PopupSelected                    ctermfg=Black       ctermbg=LightGray   cterm=NONE      guifg=#000000   guibg=#A9A9A9   gui=NONE
hi TabLine                          ctermfg=Black       ctermbg=DarkGray    cterm=NONE      guifg=#A9A9A9   guibg=#21252B   gui=NONE
hi TabLineFill                      ctermfg=Black       ctermbg=Gray        cterm=NONE      guifg=#21252B   guibg=#21252B   gui=NONE
hi TabLineSel                       ctermfg=Black       ctermbg=LightGray   cterm=NONE      guifg=#000000   guibg=#A9A9A9   gui=NONE
hi SpellBad                         ctermfg=NONE        ctermbg=NONE        cterm=Undercurl guifg=NONE      guibg=NONE      gui=Undercurl   guisp=#AE508D
hi SpellCap                         ctermfg=NONE        ctermbg=NONE        cterm=Undercurl guifg=NONE      guibg=NONE      gui=Undercurl   guisp=#92BDE8
hi SpellLocal                       ctermfg=NONE        ctermbg=NONE        cterm=Undercurl guifg=NONE      guibg=NONE      gui=Undercurl   guisp=#A3D97D
hi SpellRare                        ctermfg=NONE        ctermbg=NONE        cterm=Undercurl guifg=NONE      guibg=NONE      gui=Undercurl   guisp=#6F6F6F
hi Terminal                         ctermfg=White       ctermbg=Black       cterm=NONE      guifg=#D3D7CF   guibg=#2E3436   gui=NONE

" ------------------------------------------------
" Code
" ------------------------------------------------
hi Comment                          ctermfg=DarkGray    ctermbg=NONE        cterm=NONE      guifg=#ABB2BF   guibg=NONE      gui=NONE
hi Constant                         ctermfg=LightBlue   ctermbg=NONE        cterm=NONE      guifg=#92BDE8   guibg=NONE      gui=NONE
    hi String                       ctermfg=LightRed    ctermbg=NONE        cterm=NONE      guifg=#FF939C   guibg=NONE      gui=NONE
    hi link Character               String
    hi link Number                  Constant
    hi link Boolean                 Constant
    hi link Float                   Constant
hi Identifier                       ctermfg=LightBlue   ctermbg=NONE        cterm=NONE      guifg=#92BDE8   guibg=NONE      gui=NONE
    hi Function                     ctermfg=DarkCyan    ctermbg=NONE        cterm=NONE      guifg=#44B3B3   guibg=NONE      gui=NONE
hi Statement                        ctermfg=LightGreen  ctermbg=NONE        cterm=NONE      guifg=#A3D97D   guibg=NONE      gui=NONE
    hi link Conditional             Statement
    hi link Repeat                  Statement
    hi link Label                   Statement
    hi link Operator                Statement
    hi link Keyword                 Statement
    hi link Exception               Statement
hi PreProc                          ctermfg=DarkCyan    ctermbg=NONE        cterm=NONE      guifg=#44B3B3   guibg=NONE      gui=NONE
    hi link Include                 PreProc
    hi link Define                  PreProc
    hi link Macro                   PreProc
    hi PreCondit                    ctermfg=LightGreen  ctermbg=NONE        cterm=NONE      guifg=#A3D97D   guibg=NONE      gui=NONE
hi Type                             ctermfg=LightGreen  ctermbg=NONE        cterm=NONE      guifg=#A3D97D   guibg=NONE      gui=NONE
    hi link StorageClass            Type
    hi link Structure               Type
    hi link Typedef                 Type
hi Special                          ctermfg=LightRed    ctermbg=NONE        cterm=NONE      guifg=#92BDE8   guibg=NONE      gui=NONE
    hi link SpecialChar             Special
    hi Tag                          ctermfg=LightGreen  ctermbg=NONE        cterm=NONE      guifg=#A3D97D   guibg=NONE      gui=NONE
    hi link Delimiter               Tag
    hi link SpecialComment          Special
    hi link Debug                   Special
hi Underlined                       ctermfg=LightBlue   ctermbg=NONE        cterm=Underline guifg=#92BDE8   guibg=NONE      gui=Underline
hi Ignore                           ctermfg=DarkGray    ctermbg=NONE        cterm=NONE      guifg=#ABB2BF   guibg=NONE      gui=NONE
hi Error                            ctermfg=White       ctermbg=DarkMagenta cterm=NONE      guifg=#FFFFFF   guibg=#AE508D   gui=NONE
hi Todo                             ctermfg=LightBlue   ctermbg=NONE        cterm=NONE      guifg=#92BDE8   guibg=NONE      gui=NONE
hi Added                            ctermfg=LightGreen  ctermbg=NONE        cterm=NONE      guifg=#A3D97D   guibg=NONE      gui=NONE
hi Changed                          ctermfg=LightBlue   ctermbg=NONE        cterm=NONE      guifg=#92BDE8   guibg=NONE      gui=NONE
hi Removed                          ctermfg=LightRed    ctermbg=NONE        cterm=NONE      guifg=#FF939C   guibg=NONE      gui=NONE

" ------------------------------------------------
" Other
" ------------------------------------------------
hi Nothing                          ctermfg=NONE        ctermbg=NONE        cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE
hi Unknown                          ctermfg=Black       ctermbg=Yellow      cterm=NONE      guifg=Black     guibg=Yellow    gui=NONE

" ============================================================================
" Color detail: 256
" ============================================================================
if s:t_Co >= 256
    "...
    unlet s:t_Co
    finish
endif

" ============================================================================
" Color detail: 16
" ============================================================================
if s:t_Co >= 16
    "...
    unlet s:t_Co
    finish
endif

" ============================================================================
" Color detail: 8
" ============================================================================
if s:t_Co >= 8
    "...
    unlet s:t_Co
    finish
endif

" ============================================================================
" Color detail: 0
" ============================================================================
if s:t_Co >= 0
    "...
    unlet s:t_Co
    finish
endif

" vim: et ts=4 sw=4 sts=4

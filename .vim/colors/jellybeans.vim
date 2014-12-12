" Vim color file
" "
" "  "    __       _ _       _                             "
" "  "    \ \  ___| | |_   _| |__   ___  __ _ _ __  ___    "
" "  "     \ \/ _ \ | | | | |  _ \ / _ \/ _  |  _ \/ __|   "
" "  "  /\_/ /  __/ | | |_| | |_| |  __/ |_| | | | \__ \   "
" "  "  \___/ \___|_|_|\__  |____/ \___|\____|_| |_|___/   "
" "  "                 \___/                               "
" "
" "         "A colorful, dark color scheme for Vim."
" "
" " File:         jellybeans.vim
" " URL:          github.com/nanotech/jellybeans.vim
" " Scripts URL:  vim.org/scripts/script.php?script_id=2555
" " Maintainer:   NanoTech (nanotech.nanotechcorp.net)
" " Version:      1.6~git
" " Last Change:  January 15th, 2012
" " License:      MIT
" " Contributors: Daniel Herbert (pocketninja)
" "               Henry So, Jr. <henryso@panix.com>
" "               David Liang <bmdavll at gmail dot com>
" "               Rich Healey (richo)
" "               Andrew Wong (w0ng)
" "
" " Copyright (c) 2009-2012 NanoTech
" "
" " Permission is hereby granted, free of charge, to any per‐
" " son obtaining a copy of this software and associated doc‐
" " umentation  files  (the “Software”), to deal in the Soft‐
" " ware without restriction,  including  without  limitation
" " the rights to use, copy, modify, merge, publish, distrib‐
" " ute, sublicense, and/or sell copies of the Software,  and
" " to permit persons to whom the Software is furnished to do
" " so, subject to the following conditions:
" "
" " The above copyright notice  and  this  permission  notice
" " shall  be  included in all copies or substantial portions
" " of the Software.
" "
" " THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY
" " KIND,  EXPRESS  OR  IMPLIED, INCLUDING BUT NOT LIMITED TO
" " THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICU‐
" " LAR  PURPOSE  AND  NONINFRINGEMENT. IN NO EVENT SHALL THE
" " AUTHORS OR COPYRIGHT HOLDERS BE  LIABLE  FOR  ANY  CLAIM,
" " DAMAGES  OR OTHER LIABILITY, WHETHER IN AN ACTION OF CON‐
" " TRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CON‐
" " NECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" " THE SOFTWARE.
"
" set background=dark
"
" hi clear
"
" if exists("syntax_on")
"   syntax reset
"   endif
"
"   let colors_name = "jellybeans"
"
"   if has("gui_running") || &t_Co == 88 || &t_Co == 256
"     let s:low_color = 0
"     else
"       let s:low_color = 1
"       endif
"
"       " Color approximation functions by Henry So, Jr. and David Liang {{{
"       " Added to jellybeans.vim by Daniel Herbert
"
"       " returns an approximate grey index for the given grey level
"       fun! s:grey_number(x)
"         if &t_Co == 88
"             if a:x < 23
"                   return 0
"                       elseif a:x < 69
"                             return 1
"                                 elseif a:x < 103
"                                       return 2
"                                           elseif a:x < 127
"                                                 return 3
"                                                     elseif a:x < 150
"                                                           return 4
"                                                               elseif a:x <
"                                                               173
"                                                                     return 5
"                                                                         elseif
"                                                                         a:x
"                                                                         <
"                                                                         196
"                                                                               return
"                                                                               6
"                                                                                   elseif
"                                                                                   a:x
"                                                                                   <
"                                                                                   219
"                                                                                         return
"                                                                                         7
"                                                                                             elseif
"                                                                                             a:x
"                                                                                             <
"                                                                                             243
"                                                                                                   return
"                                                                                                   8
"                                                                                                       else
"                                                                                                             return
"                                                                                                             9
"                                                                                                                 endif
"                                                                                                                   else
"                                                                                                                       if
"                                                                                                                       a:x
"                                                                                                                       <
"                                                                                                                       14
"                                                                                                                             return
"                                                                                                                             0
"                                                                                                                                 else
"                                                                                                                                       let
"                                                                                                                                       l:n
"                                                                                                                                       =
"                                                                                                                                       (a:x
"                                                                                                                                       -
"                                                                                                                                       8)
"                                                                                                                                       /
"                                                                                                                                       10
"                                                                                                                                             let
"                                                                                                                                             l:m
"                                                                                                                                             =
"                                                                                                                                             (a:x
"                                                                                                                                             -
"                                                                                                                                             8)
"                                                                                                                                             %
"                                                                                                                                             10
"                                                                                                                                                   if
"                                                                                                                                                   l:m
"                                                                                                                                                   <
"                                                                                                                                                   5
"                                                                                                                                                           return
"                                                                                                                                                           l:n
"                                                                                                                                                                 else
"                                                                                                                                                                         return
"                                                                                                                                                                         l:n
"                                                                                                                                                                         +
"                                                                                                                                                                         1
"                                                                                                                                                                               endif
"                                                                                                                                                                                   endif
"                                                                                                                                                                                     endif
"                                                                                                                                                                                     endfun
"
"                                                                                                                                                                                     "
"                                                                                                                                                                                     returns
"                                                                                                                                                                                     (a:r)
"                                                                                                                                                                                       let
"                                                                                                                                                                                       l:gy
"                                                                                                                                                                                       =
"                                                                                                                                                                                       s:grey_number(a:g)
"                                                                                                                                                                                         let
"                                                                                                                                                                                         l:gz
"                                                                                                                                                                                         =
"                                                                                                                                                                                         s:grey_number(a:b)
"
"                                                                                                                                                                                           "
"                                                                                                                                                                                           get
"                                                                                                                                                                                           the
"                                                                                                                                                                                           closest
"                                                                                                                                                                                           color
"                                                                                                                                                                                             let
"                                                                                                                                                                                             l:x
"                                                                                                                                                                                             =
"                                                                                                                                                                                             s:rgb_number(a:r)
"                                                                                                                                                                                               let
"                                                                                                                                                                                               l:y
"                                                                                                                                                                                               =
"                                                                                                                                                                                               s:rgb_number(a:g)
"                                                                                                                                                                                                 let
"                                                                                                                                                                                                 l:z
"                                                                                                                                                                                                 =
"                                                                                                                                                                                                 s:rgb_number(a:b)
"
"                                                                                                                                                                                                   if
"                                                                                                                                                                                                   l:gx
"                                                                                                                                                                                                   ==
"                                                                                                                                                                                                   l:gy
"                                                                                                                                                                                                   &&
"                                                                                                                                                                                                   l:gy
"                                                                                                                                                                                                   ==
"                                                                                                                                                                                                   l:gz
"                                                                                                                                                                                                       "
"                                                                                                                                                                                                       there
"                                                                                                                                                                                                       are
"                                                                                                                                                                                                       two
"                                                                                                                                                                                                       possibilities
"                                                                                                                                                                                                           let
"                                                                                                                                                                                                           l:dgr
"                                                                                                                                                                                                           =
"                                                                                                                                                                                                           s:grey_level(l:gx)
"                                                                                                                                                                                                           -
"                                                                                                                                                                                                           a:r
"                                                                                                                                                                                                               let
"                                                                                                                                                                                                               l:dgg
"                                                                                                                                                                                                               =
"                                                                                                                                                                                                               s:grey_level(l:gy)
"                                                                                                                                                                                                               -
"                                                                                                                                                                                                               a:g
"                                                                                                                                                                                                                   let
"                                                                                                                                                                                                                   l:dgb
"                                                                                                                                                                                                                   =
"                                                                                                                                                                                                                   s:grey_level(l:gz)
"                                                                                                                                                                                                                   -
"                                                                                                                                                                                                                   a:b
"                                                                                                                                                                                                                       let
"                                                                                                                                                                                                                       l:dgrey
"                                                                                                                                                                                                                       =
"                                                                                                                                                                                                                       (l:dgr
"                                                                                                                                                                                                                       *
"                                                                                                                                                                                                                       l:dgr)
"                                                                                                                                                                                                                       +
"                                                                                                                                                                                                                       (l:dgg
"                                                                                                                                                                                                                       *
"                                                                                                                                                                                                                       l:dgg)
"                                                                                                                                                                                                                       +
"                                                                                                                                                                                                                       (l:dgb
"                                                                                                                                                                                                                       *
"                                                                                                                                                                                                                       l:dgb)
"                                                                                                                                                                                                                           let
"                                                                                                                                                                                                                           l:dr
"                                                                                                                                                                                                                           =
"                                                                                                                                                                                                                           s:rgb_level(l:gx)
"                                                                                                                                                                                                                           -
"                                                                                                                                                                                                                           a:r
"                                                                                                                                                                                                                               let
"                                                                                                                                                                                                                               l:dg
"                                                                                                                                                                                                                               =
"                                                                                                                                                                                                                               s:rgb_level(l:gy)
"                                                                                                                                                                                                                               -
"                                                                                                                                                                                                                               a:g
"                                                                                                                                                                                                                                   let
"                                                                                                                                                                                                                                   l:db
"                                                                                                                                                                                                                                   =
"                                                                                                                                                                                                                                   s:rgb_level(l:gz)
"                                                                                                                                                                                                                                   -
"                                                                                                                                                                                                                                   a:b
"                                                                                                                                                                                                                                       let
"                                                                                                                                                                                                                                       l:drgb
"                                                                                                                                                                                                                                       =
"                                                                                                                                                                                                                                       (l:dr
"                                                                                                                                                                                                                                       *
"                                                                                                                                                                                                                                       l:dr)
"                                                                                                                                                                                                                                       +
"                                                                                                                                                                                                                                       (l:dg
"                                                                                                                                                                                                                                       *
"                                                                                                                                                                                                                                       l:dg)
"                                                                                                                                                                                                                                       +
"                                                                                                                                                                                                                                       (l:db
"                                                                                                                                                                                                                                       *
"                                                                                                                                                                                                                                       l:db)
"                                                                                                                                                                                                                                           if
"                                                                                                                                                                                                                                           l:dgrey
"                                                                                                                                                                                                                                           <
"                                                                                                                                                                                                                                           l:drgb
"                                                                                                                                                                                                                                                 "
"                                                                                                                                                                                                                                                 use
"                                                                                                                                                                                                                                                 the
"                                                                                                                                                                                                                                                 grey
"                                                                                                                                                                                                                                                       return
"                                                                                                                                                                                                                                                       s:grey_color(l:gx)
"                                                                                                                                                                                                                                                           else
"                                                                                                                                                                                                                                                                 "
"                                                                                                                                                                                                                                                                 use
"                                                                                                                                                                                                                                                                 the
"                                                                                                                                                                                                                                                                 color
"                                                                                                                                                                                                                                                                       return
"                                                                                                                                                                                                                                                                       s:rgb_color(l:x,
"                                                                                                                                                                                                                                                                       l:y,
"                                                                                                                                                                                                                                                                       l:z)
"                                                                                                                                                                                                                                                                           endif
"                                                                                                                                                                                                                                                                             else
"                                                                                                                                                                                                                                                                                 "
"                                                                                                                                                                                                                                                                                 only
"                                                                                                                                                                                                                                                                                 one
"                                                                                                                                                                                                                                                                                 possibility
"                                                                                                                                                                                                                                                                                     return
"                                                                                                                                                                                                                                                                                     s:rgb_color(l:x,
"                                                                                                                                                                                                                                                                                     l:y,
"                                                                                                                                                                                                                                                                                     l:z)
"                                                                                                                                                                                                                                                                                       endif
"                                                                                                                                                                                                                                                                                       endfun
"
"                                                                                                                                                                                                                                                                                       "
"                                                                                                                                                                                                                                                                                       returns
"                                                                                                                                                                                                                                                                                       the
"                                                                                                                                                                                                                                                                                       palette
"                                                                                                                                                                                                                                                                                       index
"                                                                                                                                                                                                                                                                                       to
"                                                                                                                                                                                                                                                                                       approximate
"                                                                                                                                                                                                                                                                                       the
"                                                                                                                                                                                                                                                                                       'rrggbb' hex string
"                                                                                                                                                                                                                                                                                       fun!
"                                                                                                                                                                                                                                                                                       s:rgb(rgb)
"                                                                                                                                                                                                                                                                                         let
"                                                                                                                                                                                                                                                                                         l:r
"                                                                                                                                                                                                                                                                                         =
"                                                                                                                                                                                                                                                                                         ("0x"
"                                                                                                                                                                                                                                                                                         .
"                                                                                                                                                                                                                                                                                         strpart(a:rgb,
"                                                                                                                                                                                                                                                                                         0,
"                                                                                                                                                                                                                                                                                         2))
"                                                                                                                                                                                                                                                                                         +
"                                                                                                                                                                                                                                                                                         0
"                                                                                                                                                                                                                                                                                           let
"                                                                                                                                                                                                                                                                                           l:g
"                                                                                                                                                                                                                                                                                           =
"                                                                                                                                                                                                                                                                                           ("0x"
"                                                                                                                                                                                                                                                                                           .
"                                                                                                                                                                                                                                                                                           l
"                                                                                                                                                                                                                                                                                           s:X("Pmenu","ffffff","606060",","White",s:termBlack)
"                                                                                                                                                                                                                                                                                             call
"                                                                                                                                                                                                                                                                                             s:X("PmenuSel","101010","eeeeee",",s:termBlack,"White")
"                                                                                                                                                                                                                                                                                             endif
"
"                                                                                                                                                                                                                                                                                             call
"                                                                                                                                                                                                                                                                                             s:X("Visual",","404040","","",s:termBlack)
call s:X("Cursor",g:jellybeans_background_color,"b0d0f0","","","")
'
call s:X("LineNr","605958",g:jellybeans_background_color,"none",s:termBlack,"")
call s:X("CursorLineNr","ccc5c4","","none","White","")
call s:X("Comment","888888","","italic","Grey","")
call s:X("Todo","c7c7c7","","bold","White",s:termBlack)

call s:X("StatusLine","000000","dddddd","italic","","White")
call s:X("StatusLineNC","ffffff","403c41","italic","White","Black")
call s:X("VertSplit","777777","403c41","",s:termBlack,s:termBlack)
call s:X("WildMenu","f0a0c0","302028","","Magenta","")

call s:X("Folded","a0a8b0","384048","italic",s:termBlack,"")
call s:X("FoldColumn","535D66","1f1f1f","","",s:termBlack)
call s:X("SignColumn","777777","333333","","",s:termBlack)
call s:X("ColorColumn","","000000","","",s:termBlack)ll s:X("Constant","cf6a4c","","","Red","")
call s:X("Special","799d6a","","","Green","")
call s:X("D540063","underline","","DarkMagenta")
call s:X("SpellLocal","","2k coffeeRegExp javaScriptRegexpString

" Lua
"
" hi! link luaOperator Conditional
"
" " C
"
" hi! link cFormat Identifier
" hi! link cOperator Constant
"
" " Objective-C/Cocoa ctermbg=235
"   hi Folded ctermbg=236
"     hi FoldColumn ctermbg=234
"       hi SignColumn ctermbg=236
"         hi CursorColumn ctermbg=234
"           hi CursorLine ctermbg=234
"             hi SpecialKey ctermbg=234
"               exec "hi NonText ctermbg=".g:jellybeans_background_color_256
"                 exec "hi LineNr ctermbg=".g:jellybeans_background_color_256
"                   hi DiffText ctermfg=81
"                     exec "hi Normal
"                     ctermbg=".g:jellybeans_background_color_256
"                       hi DbgBreakPt ctermbg=53
"                         hi IndentGuidesOdd ctermbg=235
"                           hi IndentGuidesEven ctermbg=234
"                           endif
"                           ")

"       }}
"   )
" )
" " "
" " "
" " "
" " "
" " "
" " "

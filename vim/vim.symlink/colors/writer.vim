" Simple black and white color scheme based in iA Writer.
" Uses bold and underline for contrast in syntax.
" One or two accent colors available; blue & red.
" Assumes Yellow is background color and White is light gray
"
" Vim
hi! StatusLine ctermbg=White ctermfg=White
hi! Error cterm=Bold ctermbg=Yellow ctermfg=Red
hi! Identifier cterm=Bold ctermfg=Black
hi! Search ctermbg=NONE ctermfg=Blue
hi! netrwClassify ctermfg=Green
hi! netrwExe ctermfg=Blue
hi! netrwDir ctermfg=DarkCyan
hi! CursorLine ctermbg=Magenta cterm=None
hi! LineNr ctermfg=White
hi! CursorLineNr ctermfg=Black
hi! Folded ctermbg=None ctermfg=White
hi! VertSplit ctermbg=Magenta ctermfg=Magenta
hi! Pmenu ctermbg=Magenta ctermfg=Cyan
hi! CtrlPPrtBase ctermfg=White
hi! CtrlPLinePre ctermfg=Yellow
hi! NonText ctermfg=Yellow
hi! SignColumn ctermbg=None

" Vim
hi! VimOption ctermfg=Black
hi! VimNotation ctermfg=Black
hi! vimFgBgAttrib ctermfg=Black
hi! vimBracket ctermfg=Black
hi! vimMapModKey ctermfg=Black
hi! vimHiAttrib ctermfg=Black
hi! vimParenSep ctermfg=Black
hi! vimLineComment ctermfg=White
hi! vimComment ctermfg=White
hi! vimCommentTitle cterm=Bold ctermfg=White
hi! vimNumber ctermfg=Black
hi! vimHighlight cterm=Bold ctermfg=Black
hi! vimAutoCmd cterm=Bold ctermfg=Black
hi! vimCommand cterm=Bold ctermfg=Black
hi! vimIsCommand cterm=Bold ctermfg=Black
hi! vimString ctermfg=Black
hi! vimContinue ctermfg=Black
hi! Statement cterm=Bold ctermfg=Black


" html
hi! htmlTag ctermfg=Black
hi! htmlEndTag ctermfg=Black
hi! htmlTagName ctermfg=Black cterm=Bold
hi! htmlString ctermfg=Black
hi! htmlComment ctermfg=White
hi! htmlCommentPart ctermfg=White
hi! javaScriptStringS ctermfg=Black
hi! javaScript ctermfg=Black

" sass
" selectors
hi! cssTagName cterm=bold ctermfg=Black
hi! sassClass cterm=bold ctermfg=Black
hi! sassClassChar ctermfg=Black
hi! sassId cterm=bold ctermfg=Black
hi! sassIdChar ctermfg=Black
hi! cssPseudoClassId ctermfg=Black
" junk
hi! cssBraces ctermfg=White
hi! sassDefinition ctermfg=White "semicolon
hi! Type ctermfg=Green
"properties
hi! sassProperty    ctermfg=Black "colon
hi! cssRenderProp   ctermfg=Black cterm=underline
hi! cssTextProp   ctermfg=Black cterm=underline
hi! cssBoxProp   ctermfg=Black cterm=underline
hi! cssFontProp   ctermfg=Black cterm=underline
hi! cssUIProp   ctermfg=Black cterm=underline
hi! cssColorProp   ctermfg=Black cterm=underline
hi! cssGeneratedContentProp   ctermfg=Black cterm=underline
hi! cssFunctionName ctermfg=Black cterm=underline
"values
hi! cssValueLength  ctermfg=Black
hi! cssValueNumber  ctermfg=Black
hi! cssColor        ctermfg=Black
hi! cssRenderAttr   ctermfg=Black
hi! cssUIAttr       ctermfg=Black
hi! cssCommonAttr   ctermfg=Black
hi! cssTextAttr     ctermfg=Black
hi! cssFontAttr     ctermfg=Black
hi! cssColorAttr    ctermfg=Black
hi! cssUrl          ctermfg=Black

hi! sassMixing      ctermfg=White

"Coffeescript
hi! coffeeComment ctermfg=White
hi! coffeeTodo cterm=bold ctermfg=White
hi! coffeeExtendedOp ctermfg=Green
hi! coffeeDotAccess ctermfg=Green
hi! coffeeConditional cterm=Bold ctermfg=Green
hi! coffeeParen ctermfg=Green
hi! coffeeParens ctermfg=Green
hi! coffeeCurly ctermfg=Green
hi! coffeeInterpDelim ctermfg=White
hi! coffeeSpecialOp ctermfg=Green
hi! coffeeString ctermfg=Black
hi! coffeeNumber ctermfg=Black
hi! coffeeSpecialVar ctermfg=DarkCyan
hi! coffeeKeyword cterm=Bold ctermfg=Black
hi! coffeeRepeat cterm=Bold ctermfg=Black
hi! coffeeOperator cterm=Bold ctermfg=Black
hi! coffeeStatement cterm=Bold ctermfg=Black
hi! coffeeEscape cterm=Bold ctermfg=Black
hi! coffeeRepeat ctermfg=Green
hi! coffeeBoolean cterm=Bold ctermfg=Black
hi! coffeeRocket ctermfg=Black
hi! coffeeObject cterm=underline ctermfg=Black
hi! coffeeObjAssign ctermfg=Green
hi! coffeeSpecialIdent ctermfg=Black
hi! coffeeConstant ctermfg=Black

"NERD Tree
hi! NERDTreeHelp ctermfg=White
hi! NERDTreeDir cterm=bold ctermfg=Black
hi! NERDTreeUp ctermfg=Black
hi! NERDTreeCWD cterm=underline ctermfg=Black
hi! NERDTreeExecFile ctermfg=Black

" Ruby
hi! rubyClass cterm=Bold ctermfg=Black
hi! rubyKeyword cterm=Bold ctermfg=Black
hi! rubyAttribute cterm=Bold ctermfg=Black
hi! rubyInclude cterm=Bold ctermfg=Black
hi! rubyDefine cterm=Bold ctermfg=Black
hi! rubyControl cterm=Bold ctermfg=Black
hi! rubyDoBlock cterm=Bold ctermfg=Black
hi! rubyConstant cterm=underline ctermfg=Black
hi! rubyStringDelimiter ctermfg=Black
hi! rubyInterpolationDelimiter cterm=Bold ctermfg=Black
hi! rubyString ctermfg=Black
hi! rubySymbol ctermfg=Black
hi! rubyInteger ctermfg=Black
hi! rubyBoolean cterm=bold ctermfg=Black

" Haml
"hi! hamlRuby ctermbg=Blue
hi! hamlRubyChar  cterm=Bold ctermfg=Black
hi! hamlIdChar    cterm=Bold ctermfg=Black
hi! hamlClassChar cterm=Bold ctermfg=Black
hi! hamlTag       cterm=Bold ctermfg=Black
hi! hamlDoctype   cterm=Bold ctermfg=Black
hi! hamlComment   cterm=Bold ctermfg=Black
hi! slimDocTypeKeyword cterm=Bold ctermfg=Black

" C
hi! cFormat cterm=bold ctermfg=Black
hi! cType cterm=bold ctermfg=Black
hi! cRepeat cterm=bold ctermfg=Black
hi! cSpecial ctermfg=White

" Lua
hi! luaOperator cterm=bold ctermfg=Black
hi! luaStatement cterm=bold ctermfg=Black
hi! luaCond cterm=bold ctermfg=Black
hi! luaElse cterm=bold ctermfg=Black
hi! luaFunction cterm=bold ctermfg=Black
hi! luaComment ctermfg=White

" Misc
hi! zshSubstDelim ctermfg=Black
hi! zshSubst ctermfg=Black
hi! zshQuoted ctermfg=Black
hi! zshDeref ctermfg=Black
hi! zshJobSpec ctermfg=Black
hi! shComment ctermfg=White
hi! shVariable ctermfg=Black
hi! shFunction ctermfg=Black
hi! shConditional cterm=Bold ctermfg=Black
hi! shDoubleQuote ctermfg=Black
hi! shTestDoubleQuote ctermfg=Black
hi! shTestSingleQuote ctermfg=Black
hi! shTestOpr ctermfg=Black
hi! shOperator ctermfg=Black
hi! shCommandSub ctermfg=Black
hi! shRange ctermfg=Black
hi! shDerefSimple cterm=Bold ctermfg=Black
hi! shDerefWordError cterm=Bold ctermfg=Black
hi! shPreProc cterm=Bold ctermfg=Black
hi! confString ctermfg=Black
hi! confComment ctermfg=White

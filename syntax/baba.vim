syntax match BabaComment /\v#.*/
syntax match BabaMetaStatement /\v\@import/
syntax match BabaMetaStatement /\v\@export/

syntax match BabaScopeIdentifier /\v^\s*$?([a-zA-Z0-9\-_\.]+)(\s*[\{])@=/
syntax match BabaListIdentifier /\v^\s*$?([a-zA-Z0-9\-_\.]+)(\s*[\[])@=/
syntax match BabaSingleIdentifier /\v^\s*\$?([a-zA-Z0-9\-_\.]+)(\s*[\<'"])@=/

syntax region BabaLiteralString start=/\v'/ skip=/\v\\./ end=/\v'/ keepend
syntax region BabaInterpolatedString start=/\v"/ skip=/\v\\./ end=/\v"/ keepend contains=BabaTag nextgroup=BabaWeight
syntax region BabaScope start='{' end='}' contains=ALLBUT,BabaListItem fold keepend
syntax region BabaList start='\[' end=']' contains=BabaLiteralString,BabaInterpolatedString,BabaComment,BabaListItem fold keepend

syntax match BabaListItem /\v[^\[\]\,\'\"\#]+/ contained
syntax match BabaWeight /\v\+\d+/ contained

syntax region BabaTag start=/\v\\@<!\</ skip=/\v\\./ end=/\v\>/ contains=BabaTag,BabaLiteralString,BabaInterpolatedString,BabaTagTransform,BabaTagIdentifier,BabaVarIdentifier
syntax match BabaVarIdentifier /\v\$[a-zA-Z0-9\-_\.]+/ contained
syntax match BabaTagIdentifier /\v<@=[a-zA-Z0-9\-_\.]+/ contained
syntax match BabaTagTransform /\v:[a-zA-Z0-9\-_\.]+/ contained

hi link BabaComment Comment

hi link BabaMetaStatement Include
hi link BabaTag Keyword
hi link BabaTagTransform Macro

hi link BabaInterpolatedString String
hi link BabaListItem String
hi link BabaLiteralString String
hi link BabaWeight Float

hi link BabaScopeIdentifier Label
hi link BabaListIdentifier Label
hi link BabaSingleIdentifier Label
hi link BabaTagIdentifier Identifier
hi link BabaVarIdentifier Operator

setlocal conceallevel=2

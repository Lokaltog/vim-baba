syntax match BabaComment /\v#.*/
syntax match BabaAtRule /\v\@use/
syntax match BabaAtRule /\v\@expose/

syntax match BabaScopeIdentifier /\v^\s*([a-zA-Z0-9\-_\.]+)(\s*[\{])@=/
syntax match BabaListIdentifier /\v^\s*([a-zA-Z0-9\-_\.]+)(\s*[\[])@=/

syntax region BabaLiteralString start=/\v'/ skip=/\v\\./ end=/\v'/ keepend
syntax region BabaInterpolatedString start=/\v"/ skip=/\v\\./ end=/\v"/ keepend contains=BabaTag
syntax region BabaScope start='{' end='}' contains=ALLBUT,BabaListItem,BabaTag fold keepend
syntax region BabaList start='\[' end=']' contains=BabaLiteralString,BabaInterpolatedString,BabaComment,BabaListItem fold keepend

syntax match BabaListItem /\v[^\[\]\,\'\"\#]+/ contained

syntax region BabaTag start=/\v\\@<!\</ skip=/\v\\./ end=/\v\>/ contained contains=BabaTag,BabaLiteralString,BabaInterpolatedString,BabaTagTransform,BabaTagIdentifier
syntax match BabaTagIdentifier /\v<@=[a-zA-Z0-9\-_\.]+/ contained
syntax match BabaTagTransform /\v:[a-zA-Z0-9\-_\.]+/ contained

hi link BabaComment Comment
hi link BabaAtRule Include
hi link BabaInterpolatedString String
hi link BabaLiteralString String
hi link BabaScopeIdentifier Label
hi link BabaListIdentifier Identifier
hi link BabaListItem String

hi link BabaTag Keyword
hi link BabaTagIdentifier Label
hi link BabaTagTransform Macro

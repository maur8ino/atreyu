Nonterminals
  Path Elem Range RangeInner RangeInnerList RangeInnerListElem QuotedIdentifier QuotedIdentifierList.

Terminals
  '[' ']' ',' '.' '\'' '"' index identifier range_separator.

Rootsymbol Path.

Path -> Elem : ['$1'].
Path -> Elem Path : ['$1'|'$2'].
Path -> Elem '.' Path : ['$1'|'$3'].

Elem -> Range : '$1'.
Elem -> QuotedIdentifier : '$1'.

Range -> '[' RangeInner ']' : '$2'.
Range -> '[' RangeInnerListElem ',' RangeInnerList ']': ['$2'|'$4'].
RangeInnerList -> RangeInnerListElem ',' RangeInnerList : ['$1'|'$3'].
RangeInnerList -> RangeInnerListElem : ['$1'].
RangeInnerListElem -> RangeInner : '$1'.
RangeInner -> index range_separator index : extract_range('$1', '$3').
RangeInner -> index :extract_token('$1').

RangeInnerList -> QuotedIdentifierList : ['$1'].
QuotedIdentifierList -> QuotedIdentifier ',' QuotedIdentifierList : ['$1','$3'].
QuotedIdentifier -> '\'' identifier '\'' : extract_token('$2').
QuotedIdentifier -> '"' identifier '"' : extract_token('$2').

Elem -> identifier : extract_token('$1').

Erlang code.

extract_token({_Token, _Line, Value}) -> Value.
extract_string_token({_Token, _Line, Value}) -> list_to_binary(Value).
extract_quoted_string_token({_Token, _Line, Value}) -> list_to_binary(lists:sublist(Value, 2, length(Value) - 2)).
extract_range({_Token1, _Line1, Value1}, {_Token2, _Line2, Value2}) -> #{from => Value1, to => Value2}.

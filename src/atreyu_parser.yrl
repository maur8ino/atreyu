Nonterminals
  Path Elem
  RoutedToken
  Range RangeInner RangeInnerList.


Terminals
  '[' ']' '{' '}' ',' '.'
  routed_token index identifier quoted_identifier range_separator.


Rootsymbol Path.


Path -> Elem : ['$1'].
Path -> Elem Path : ['$1'|'$2'].
Path -> Elem '.' Path : ['$1'|'$3'].

Elem -> RoutedToken : '$1'.
Elem -> Range : '$1'.
Elem -> identifier : extract_string_token('$1').

RoutedToken -> '[' '{' routed_token '}' ']': extract_routed_token('$3').

Range -> '[' RangeInner ',' RangeInnerList ']': ['$2'|'$4'].
Range -> '[' RangeInner ']' : '$2'.

RangeInnerList -> RangeInner ',' RangeInnerList : ['$1'|'$3'].
RangeInnerList -> RangeInner : ['$1'].

RangeInner -> index range_separator index : extract_range('$1', '$3').
RangeInner -> index : extract_integer_token('$1').
RangeInner -> quoted_identifier : extract_quoted_string_token('$1').


Erlang code.

% Utility function
first(Value) -> lists:nth(1, Value).
trim(Value) -> re:replace(Value, "[\s\t\n\r]+", "", [global, {return, list}]).

% Extract token function
extract_token({_Token, _Line, Value}) -> Value.
extract_integer_token({_Token, _Line, Value}) -> list_to_integer(Value).
extract_string_token({_Token, _Line, Value}) -> list_to_binary(Value).
extract_quoted_string_token({_Token, _Line, Value}) ->
  list_to_binary(lists:sublist(Value, 2, length(Value) - 2)).
extract_range({_Token1, _Line1, Value1}, {_Token2, _Line2, Value2}) ->
  #{from => list_to_integer(Value1), to => list_to_integer(Value2)}.
extract_routed_token({_Token, _Line, Value}) ->
  case string:tokens(Value, ":") of
    [Type] -> #{type => list_to_binary(Type),
                named => false,
                name => list_to_binary("")};
    [Type|Name] -> #{type => list_to_binary(Type),
                     named => true,
                     name => list_to_binary(trim(first(Name)))}
  end.

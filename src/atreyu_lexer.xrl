% Atreyu Lexer
%
% See the spec reference https://github.com/Netflix/falcor-path-syntax/blob/master/spec/language.md
% The relevant version is also copied into this repo
% See also http://netflix.github.io/falcor/documentation/paths.html

Definitions.

% Ignored tokens
WhiteSpace          = [\x{0009}\x{000B}\x{000C}\x{0020}\x{00A0}]
_LineTerminator     = \x{000A}\x{000D}\x{2028}\x{2029}
LineTerminator      = [{_LineTerminator}]
Ignored             = {WhiteSpace}|{LineTerminator}

% Lexical tokens
Identifier          = [A-Za-z_$][A-Za-z_$0-9]*
Index               = -?[0-9]+
RangeSeparator      = \.\.|\.\.\.


Rules.

{Ignored}           : skip_token.
{Index}             : {token, {index, TokenLine, list_to_integer(TokenChars)}}.
{Identifier}        : {token, {identifier, TokenLine, list_to_binary(TokenChars)}}.
{RangeSeparator}    : {token, {range_separator, TokenLine, TokenChars}}.
\[                  : {token, {'[', TokenLine}}.
\]                  : {token, {']', TokenLine}}.
\.                  : {token, {'.', TokenLine}}.
\,                  : {token, {',', TokenLine}}.
\'                  : {token, {'\'', TokenLine}}.
\"                  : {token, {'\"', TokenLine}}.

Erlang code.

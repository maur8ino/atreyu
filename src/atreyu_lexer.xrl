% Atreyu Lexer
%
% See the spec reference https://github.com/Netflix/falcor-path-syntax/blob/master/spec/language.md
% The relevant version is also copied into this repo
% See also http://netflix.github.io/falcor/documentation/paths.html

Definitions.

% Ignored tokens
WhiteSpace          = [\s\t\n\r]
Ignored             = {WhiteSpace}

% Lexical tokens
RoutedToken         = (ranges|integers|keys):?{WhiteSpace}*[A-Za-z]*{WhiteSpace}*
Index               = -?[0-9]+
Identifier          = [A-Za-z_$][A-Za-z_$0-9]*
QuotedIdentifier    = "[^"]+"|'[^']+'
RangeSeparator      = \.\.|\.\.\.


Rules.

{RoutedToken}       : {token, {routed_token, TokenLine, TokenChars}}.
{Index}             : {token, {index, TokenLine, TokenChars}}.
{Identifier}        : {token, {identifier, TokenLine, TokenChars}}.
{QuotedIdentifier}  : {token, {quoted_identifier, TokenLine, TokenChars}}.
{RangeSeparator}    : {token, {range_separator, TokenLine, TokenChars}}.
\[                  : {token, {'[', TokenLine}}.
\]                  : {token, {']', TokenLine}}.
\{                  : {token, {'{', TokenLine}}.
\}                  : {token, {'}', TokenLine}}.
\.                  : {token, {'.', TokenLine}}.
\,                  : {token, {',', TokenLine}}.
{Ignored}+          : skip_token.

Erlang code.

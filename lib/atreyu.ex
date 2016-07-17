defmodule Atreyu do

  @moduledoc """
  Atreyu is the server side implementation of Netflix's Falcor
  [http://netflix.github.io/falcor/](http://http://netflix.github.io/falcor/).

  Atreyu is heavily inspired by Absinthe, the GraphQL client for Elixir
  [https://github.com/absinthe-graphql/absinthe](https://github.com/absinthe-graphql/absinthe).
  """

  def tokenize(string) do
    {:ok, tokens, _} = string |> to_char_list |> :atreyu_lexer.string
    {:ok, tokens}
  end

  def parse(string) do
    {:ok, tokens} = tokenize(string)
    :atreyu_parser.parse(tokens)
  end

end

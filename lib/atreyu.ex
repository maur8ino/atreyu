defmodule Atreyu do

  @moduledoc """
  Atreyu is the server side implementation of Netflix's Falcor [http://netflix.github.io/falcor/](http://http://netflix.github.io/falcor/).
  """

  def tokenize(string) do
    {:ok, tokens, _} = string |> to_char_list |> :atreyu_lexer.string
    tokens
  end

  def parse(string) do
    {:ok, tokens, _} = string |> to_char_list |> :atreyu_lexer.string
    :atreyu_parser.parse(tokens)
  end

end

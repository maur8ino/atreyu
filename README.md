# Atreyu

Atreyu is the server side implementation in Elixir of Netflix's Falcor
[http://netflix.github.io/falcor/](http://http://netflix.github.io/falcor/).

Atreyu is heavily inspired by Absinthe, the GraphQL client for Elixir
[https://github.com/absinthe-graphql/absinthe](https://github.com/absinthe-graphql/absinthe).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `atreyu` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:atreyu, "~> 0.1.0"}]
    end
    ```

  2. Ensure `atreyu` is started before your application:

    ```elixir
    def application do
      [applications: [:atreyu]]
    end
    ```

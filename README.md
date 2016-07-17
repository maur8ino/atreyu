# Atreyu

[![Atreyu scratching Falkor]
(http://66.media.tumblr.com/1fb0a0dbea66cd6599cb015032f2cafb/tumblr_mtl9bwiF8f1s213bto1_500.gif)]
(http://nihmue.tumblr.com/post/62071972877/never-ending-story)

**Atreyu** server side implementation of Netflix's [Falcor]
(http://http://netflix.github.io/falcor/) for Elixir.

[![Build Status](https://travis-ci.org/maur8ino/atreyu.svg?branch=master)]
(https://travis-ci.org/maur8ino/atreyu)

**Atreyu** is heavily inspired by Absinthe, the GraphQL client for Elixir
([https://github.com/absinthe-graphql/absinthe](https://github.com/absinthe-graphql/absinthe)).

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

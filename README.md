# Atreyu

[![Build Status](https://travis-ci.org/maur8ino/atreyu.svg?branch=master)]
(https://travis-ci.org/maur8ino/atreyu)

[![Atreyu scratching Falkor]
(http://66.media.tumblr.com/1fb0a0dbea66cd6599cb015032f2cafb/tumblr_mtl9bwiF8f1s213bto1_500.gif)]
(http://nihmue.tumblr.com/post/62071972877/never-ending-story)

**Atreyu** ~~is~~ will be a server side implementation of Netflix's [Falcor]
(http://netflix.github.io/falcor/) for Elixir.

**Atreyu** is heavily inspired by Absinthe, the GraphQL client for Elixir
([https://github.com/absinthe-graphql/absinthe](https://github.com/absinthe-graphql/absinthe)).

## Todo list
- [x] parser for Falcor's [path syntax](http://netflix.github.io/falcor/documentation/paths.html)
- [x] JSON Graph helper
- [ ] Route configurator
- [ ] Router
- [ ] Plug support
- [ ] Documentation

## Installation

**Atreyu** is still a work in progress and will be available on Hex once it will reach a stable state.

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

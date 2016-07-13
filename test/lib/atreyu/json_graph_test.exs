defmodule Atreyu.JSONGraphTest do
  use ExUnit.Case

  alias Atreyu.JSONGraph
  doctest JSONGraph

  test "ref returns a map with $type ref" do
    element = JSONGraph.ref(["todosById", 42], %{ "foo" => :true, "bar" => :false })
    assert "ref" == element["$type"]
    assert ["todosById", 42] == element["value"]
    assert :true == element["foo"]
  end

  test "atom returns a map with $type atom" do
    element = JSONGraph.atom(4, %{ "$expires" => 5000 })
    assert "atom" == element["$type"]
    assert 4 == element["value"]
    assert 5000 == element["$expires"]
  end

  test "error returns a map with $type error" do
    element = JSONGraph.error("this is an error", %{ "foo" => :true, "bar" => :false })
    assert "error" == element["$type"]
    assert "this is an error" == element["value"]
    assert :true == element["foo"]
  end

  test "undefined returns a map with $type atom" do
    element = JSONGraph.undefined()
    assert "atom" == element["$type"]
    assert nil == element["value"]
  end

  test "path_value returns a map with path and value" do
    element = JSONGraph.path_value("movies/list", 42)
    assert "movies/list" == element["path"]
    assert 42 == element["value"]
  end

  test "path_invalidation returns a map with path and invalidated" do
    element = JSONGraph.path_invalidation("movies/list")
    assert "movies/list" == element["path"]
    assert :true == element["invalidated"]
  end
end

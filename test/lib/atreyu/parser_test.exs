defmodule Atreyu.ParserTest do
  use ExUnit.Case

  import Atreyu

  test "parses a simple key string" do
    assert {:ok, ["one", "two", "three"]} = parse("one.two.three")
  end

  test "parses a string with indexers" do
    assert {:ok, ["one", 0]} = parse("one[0]")
  end

  test "parses a string with indexers followed by dot separators" do
    assert {:ok, ["one", 0, "oneMore"]} = parse("one[0].oneMore")
  end

  test "parses a string with a range" do
    assert {:ok, ["one", %{from: 0, to: 5}, "oneMore"]} = parse("one[0..5].oneMore")
  end

  test "treats 07 as 7" do
    assert {:ok, ["one", [7, 1], "oneMore"]} = parse("one[07, 0001].oneMore")
  end

  test "parses a string with multiple ranges" do
    assert {:ok, ["one", [%{from: 0, to: 1}, %{from: 3, to: 4}], "oneMore"]} = parse("one[0..1,3...4].oneMore")
  end

  test "parses a string with a set of tokens" do
    assert {:ok, ["one", ["test", "test2"], "oneMore"]} = parse(~s(one["test", 'test2'].oneMore))
  end

  test "parses paths with newlines and whitespace between indexer keys" do
    assert {:ok, ["one", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], "oneMore"]} = parse("one[\n\
        0, 1, 2, 3, 4, \n\
        5, 6, 7, 8, 9].oneMore")
  end

  test "parses routed token for the path" do
    assert {:ok, ["one", %{type: "ranges", named: false, name: ""}, "oneMore"]} = parse("one[{ranges}].oneMore")
  end

  test "parses named routed token for the path" do
    assert {:ok, ["one", %{type: "ranges", named: true, name: "foo"}, "oneMore"]} = parse("one[{ranges:foo}].oneMore")
  end

  test "parses named (with space around) routed token for the path" do
    assert {:ok, ["one", %{type: "ranges", named: true, name: "foo"}, "oneMore"]} = parse("one[{ranges:\t\n\r foo \t\n\r}].oneMore")
  end

  test "gives error on a bad path" do
    assert {:error, _} = parse("one[{ranges:f o o}].oneMore")
  end
end

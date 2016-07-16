defmodule Atreyu.ParserTest do
  use ExUnit.Case

  test "parses a simple key string" do
    assert {:ok, ["one", "two", "three"]} = Atreyu.parse("one.two.three")
  end

  test "parses a string with indexers" do
    assert {:ok, ["one", 0]} = Atreyu.parse("one[0]")
  end

  test "parses a string with indexers followed by dot separators" do
    assert {:ok, ["one", 0, "oneMore"]} = Atreyu.parse("one[0].oneMore")
  end

  test "parses a string with a range" do
    assert {:ok, ["one", %{from: 0, to: 5}, "oneMore"]} = Atreyu.parse("one[0..5].oneMore")
  end

  test "parses a string with multiple ranges" do
    assert {:ok, ["one", [%{from: 0, to: 1}, %{from: 3, to: 4}], "oneMore"]} = Atreyu.parse("one[0..1,3...4].oneMore")
  end

  test "parses a string with a set of tokens" do
    assert {:ok, ["one", ["test", "test2"], "oneMore"]} = Atreyu.parse("one['test', 'test2'].oneMore")
  end
end

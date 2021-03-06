defmodule Atreyu.JSONGraph do
  @moduledoc """
  Helper function to format a JSON Graph
  """

  defp sentinel(type, value \\ nil, props \\ %{}), do: Map.merge(props, %{"$type" => type, "value" => value})

  def ref(path, props), do: sentinel("ref", path, props)
  def atom(value, props), do: sentinel("atom", value, props)
  def undefined(), do: sentinel("atom")
  def error(error_value, props), do: sentinel("error", error_value, props)
  def path_value(path, value), do: %{"path" => path, "value" => value}
  def path_invalidation(path), do: %{"path" => path, "invalidated" => :true}
end

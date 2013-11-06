defprotocol Dag.Hashable do

  @doc """
  Return the data to be used when hashing
  """
  def get_data(object)
end

defmodule Dag.Hash do
  alias Dag.Hashable

  @doc """
  Computes a SHA384 bit digest of the provided object
  """
  def hash(object) do
    :crypto.hash(:sha384, Hashable.get_data(object))
    |> hash_to_hex
  end

  def hash_to_hex(hash) do
    hash
    |> :binary.bin_to_list
    |> Enum.map(fn(char) -> :io_lib.format("~2.16.0b", [char]) end)
    |> Enum.join
  end
end

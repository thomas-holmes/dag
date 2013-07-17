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
  end
end

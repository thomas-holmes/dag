defprotocol Dag.Serializable do

  @doc """
  Return the serialized format
  """
  def get_serialized_data(object)
end

defprotocol Dag.Deserializable do
  def get_deserialized_object(type, hash, content)
end

defmodule Dag.Serialize do
  alias Dag.Serializable
  alias Dag.Deserializable
  
  def serialize(object) do
    Serializable.get_serialized_data(object)
  end

  def deserialize(content) do
    _deserialize(content)
  end

  defp _deserialize([ type | tail ]) do
    _deserialize(:blob, tail)
  end

  defp _deserialize(type, [ hash | tail]) when is_atom(type) do
    Dag.Deserializable.get_deserialized_object(type, hash, tail)
  end
end
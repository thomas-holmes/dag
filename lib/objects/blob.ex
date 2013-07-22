defrecord Dag.Objects.Blob, type: :blob, data: <<>>, hash: <<>> do
  @moduledoc """
       Blob is generally not meant to be made itself. Use
       Dag.Objects.create_blob to construct a blob
  """
end

defimpl Dag.Hashable, for: Dag.Objects.Blob do
  def get_data(object), do: object.data
end

defimpl Dag.Serializable, for: Dag.Objects.Blob do
  def get_serialized_data(object), do: "#{object.type}\n#{object.hash}\n#{object.data}"
end

defimpl Dag.Deserializable, for: Atom do
  def get_deserialized_object(:blob, hash, content) do
    Dag.Objects.Blob.new(data: Enum.join(content, "\n"), hash: hash)
  end
end

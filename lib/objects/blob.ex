defrecord Dag.Objects.Blob, type: :blob, data: <<>>, hash: <<>> do
  @moduledoc """
       Blob is generally not meant to be made itself. Use
       Dag.Objects.create_blob to construct a blob
  """
end

defimpl Dag.Hashable, for: Dag.Objects.Blob do
  def get_data(object), do: object.data
end
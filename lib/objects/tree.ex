defrecord Dag.Objects.Tree, type: :tree, hash: <<>>, refs: [] do

  def deserialize(hash, content) do
    Dag.Objects.Tree.new(type: :tree, hash: hash, refs: content)
  end
end

defimpl Dag.Hashable, for: Dag.Objects.Tree do
  def get_data(object), do: Enum.join(object.refs, "\n")
end

defimpl Dag.Serializable, for: Dag.Objects.Tree do
  def get_serialized_data(object) do
    "#{object.type}\n#{object.hash}\n" <> Enum.join(object.refs, "\n")
  end
end

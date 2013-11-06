Code.require_file "test_helper.exs", __DIR__

defmodule TreeTest do
  use ExUnit.Case
  alias Dag.Objects.Tree
  alias Dag.Hashable
  alias Dag.Serializable

  test "Tree has :type of :tree" do
    tree = Tree.new
    assert tree.type == :tree
  end

  test "Tree holds hash refs to other objects" do
    tree = Tree.new refs: ["a", "b", "c"]
    assert tree.refs == ["a", "b", "c"]
  end

  test "Tree implements Dag.Hashable protocol" do
    tree = Tree.new refs: ["a", "b", "c"]
    assert Dag.Hashable.get_data(tree) != nil
  end

  test "Tree implements Dag.Hashable.get_data correctly" do
    refs = ["a", "b", "c"]
    tree = Tree.new refs: refs
    assert Dag.Hashable.get_data(tree) == Enum.join(refs, "\n")
  end

  test "Tree implements Dag.Serializable protocol" do
    tree = Tree.new refs: ["a", "b", "c"]
    assert Serializable.get_serialized_data(tree) != nil
  end

  test "Tree can be deserialized" do
    tree = Tree.new refs: ["a", "b", "c"]
    tree = tree.hash(Dag.Hash.hash(tree))
    serialized_tree = Dag.Serialize.serialize(tree)
    deserialized_tree = Dag.Serialize.deserialize(String.split(serialized_tree, "\n"))
    assert tree == deserialized_tree
  end
end


#Enum.map(binary_to_list(b), fn(j) -> :io.format("~-8.16b~n", binary_to_list(<<j>>)) end)
#:io.format("~2.16.0b", [15])

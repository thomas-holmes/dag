Code.require_file "test_helper.exs", __DIR__

defmodule TreeTest do
  use ExUnit.Case
  alias Dag.Objects.Tree
  alias Dag.Hashable

  test "Tree has :type of :tree" do
    tree = Tree.new
    assert tree.type == :tree
  end

  test "Tree holds hash refs to other objects" do
    tree = Tree.new refs: ["a", "b", "c"]
    assert tree.refs == ["a", "b", "c"]
  end
end

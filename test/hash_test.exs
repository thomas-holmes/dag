Code.require_file "test_helper.exs", __DIR__

defmodule HashTest do
  use ExUnit.Case

  alias Dag.Hash

  test "Hash.hash hashes digest of given object using SHA384" do
    hashed_text = Hash.hash("sample data")
    expected_text = :crypto.hash(:sha384, "sample data") |> Hash.hash_to_hex
    assert hashed_text == expected_text
  end
end

# Implementing Dag.Hashable for strings to simplify testing
defimpl Dag.Hashable, for: BitString do
  def get_data(string), do: string
end

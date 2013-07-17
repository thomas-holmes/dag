Code.require_file "test_helper.exs", __DIR__

defmodule BlobTest do
  use ExUnit.Case
  alias Dag.Blob

  test "Blob has :type of :blob" do
    blob = Blob.new(data: "sample data")
    assert blob.type == :blob
  end

  test "Blob holds provided data" do
    blob = Blob.new(data: "sample data")
    assert blob.data == "sample data"
  end

  test "Blob has a hash" do
    blob = Blob.new(data: "sample data", hash: "abcde123")
    assert blob.hash  == "abcde123"
  end
end

defmodule HCLTest do
  use ExUnit.Case
  doctest HCL

  alias HttpParser.Response

  describe "get" do

    test "gets a simple response" do
      assert {:ok, %Response{status_code: 200}} = HCL.get("http://httpstat.us/200")
    end

  end
end

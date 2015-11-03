defmodule SupervisordTest do
  use ExUnit.Case
  doctest Supervisord

  @base_url "http://localhost:9001"

  setup do
    Supervisord.start
  end

  test "start process group" do
    res = %Supervisord.Options{base_url: @base_url}
      |> Supervisord.start_process_group "test"
    assert res == %XMLRPC.MethodResponse{}
  end
end

defmodule Supervisord.Options do
  defstruct base_url: "", user: nil, password: nil

  def url(options) do
    options.base_url <> "/RPC2"
  end

  def basic_auth(%Supervisord.Options{base_url: _, user: user, password: password}) do
    basic_auth(user, password)
  end
  defp basic_auth(nil, nil), do: []
  defp basic_auth(user, password) do
    [hackney: [basic_auth: {user, password}]]
  end
end

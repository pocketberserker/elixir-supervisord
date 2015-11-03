defmodule Supervisord do
  use HTTPoison.Base
  alias Supervisord.Options

  @headers [
    "User-Agent": "Elixir XML-RPC Client",
    "Content-Type": "text/xml",
    "Accept": "text/xml",
    "Accept-Charset": "UTF8",
    "Connection": "Keep-Alive"
  ]

  def process_request_body(body), do: XMLRPC.encode!(body)
  def process_response_body(body), do: XMLRPC.decode!(body)

  def start_process_group(options, name) do
    post_xml_rpc(options, "supervisor.startProcessGroup", [name])
  end

  def stop_process_group(options, name) do
    post_xml_rpc(options, "supervisor.stopProcessGroup", [name])
  end

  defp post_xml_rpc(options, name, params) do
    url = Options.url(options)
    basic_auth = Options.basic_auth(options)
    request = %XMLRPC.MethodCall{method_name: name, params: params}
    post!(url, request, @headers, basic_auth).body
  end
end

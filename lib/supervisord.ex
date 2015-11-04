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

  def add_process_group(options, name) do
    post_xml_rpc(options, "supervisor.addProcessGroup", [name])
  end

  def clear_all_process_logs(options) do
    post_xml_rpc(options, "supervisor.clearAllProcessLogs", [])
  end

  def clear_log(options) do
    post_xml_rpc(options, "supervisor.clearLog", [])
  end

  def clear_process_logs(options, name) do
    post_xml_rpc(options, "supervisor.clearProcessLogs", [name])
  end

  def get_api_version(options) do
    post_xml_rpc(options, "supervisor.getAPIVersion", [])
  end

  def get_all_process_info(options) do
    post_xml_rpc(options, "supervisor.getAllProcessInfo", [])
  end

  def get_identification(options) do
    post_xml_rpc(options, "supervisor.getIdentification", [])
  end

  def get_pid(options) do
    post_xml_rpc(options, "supervisor.getPID", [])
  end

  def get_process_info(options, name) do
    post_xml_rpc(options, "supervisor.getProcessInfo", [name])
  end

  def get_state(options) do
    post_xml_rpc(options, "supervisor.getState", [])
  end

  def get_supervisor_version(options) do
    post_xml_rpc(options, "supervisor.getSupervisorVersion", [])
  end

  def read_log(options, offset, length) do
    post_xml_rpc(options, "supervisor.readLog", [offset, length])
  end

  def read_process_stderr_log(options, name, offset, length) do
    post_xml_rpc(options, "supervisor.readProcessStderrLog", [name, offset, length])
  end

  def read_process_stdout_log(options, name, offset, length) do
    post_xml_rpc(options, "supervisor.readProcessStdoutLog", [name, offset, length])
  end

  def remove_process_group(options, name) do
    post_xml_rpc(options, "supervisor.removeProcessGroup", [name])
  end

  def restart(options) do
    post_xml_rpc(options, "supervisor.restart", [])
  end

  def send_process_stdin(options, name, chars) do
    post_xml_rpc(options, "supervisor.sendProcessStdin", [name, chars])
  end

  def send_remote_comm_event(options, type, data) do
    post_xml_rpc(options, "supervisor.sendRemoteCommEvent", [type, data])
  end

  def shutdown(options) do
    post_xml_rpc(options, "supervisor.shutdown", [])
  end

  def start_all_processes(options) do
    post_xml_rpc(options, "supervisor.startAllProcesses", [])
  end

  def start_process(options, name) do
    post_xml_rpc(options, "supervisor.startProcess", [name])
  end

  def start_process_group(options, name) do
    post_xml_rpc(options, "supervisor.startProcessGroup", [name])
  end

  def stop_all_processes(options) do
    post_xml_rpc(options, "supervisor.stopAllProcesses", [])
  end

  def stop_process(options, name) do
    post_xml_rpc(options, "supervisor.stopProcess", [name])
  end

  def stop_process_group(options, name) do
    post_xml_rpc(options, "supervisor.stopProcessGroup", [name])
  end

  def tail_process_stderr_log(options, name, offset, length) do
    post_xml_rpc(options, "supervisor.tailProcessStderrLog", [name, offset, length])
  end

  def tail_process_stdout_log(options, name, offset, length) do
    post_xml_rpc(options, "supervisor.tailProcessStdoutLog", [name, offset, length])
  end

  def list_methods(options) do
    post_xml_rpc(options, "system.listMethods", [])
  end

  def method_help(options, name) do
    post_xml_rpc(options, "system.methodHelp", [name])
  end

  def method_signature(options, name) do
    post_xml_rpc(options, "system.methodSignature", [name])
  end

  def multicall(options, calls) do
    post_xml_rpc(options, "system.multicall", [calls])
  end

  defp post_xml_rpc(options, name, params) do
    url = Options.url(options)
    basic_auth = Options.basic_auth(options)
    request = %XMLRPC.MethodCall{method_name: name, params: params}
    post!(url, request, @headers, basic_auth).body
  end
end

defmodule HCL do
  @user_agent "HCL #{Mix.Project.config[:version]}"
  @default_headers [{"User-Agent", @user_agent}, {"Connection", "close"}]

  alias HCL.Conn

  def get(url)
  when is_binary(url) do
    uri = URI.parse(url)

    request = %HttpParser.Request{
      uri: uri,
      headers: @default_headers
    }

    http_req = HttpParser.create_request(request)

    {:ok, conn} = Conn.start_link(uri.host |> to_charlist, uri.port)

    :ok = Conn.send(conn, http_req)
    {:ok, raw_resp} = Conn.recv(conn, 0)

    HttpParser.Response.parse(raw_resp)
  end

end

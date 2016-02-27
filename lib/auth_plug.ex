defmodule FromSpace.Plug.Auth do
  @behaviour Plug
  import Plug.Conn
  import Phoenix.Controller, only: [put_flash: 3, redirect: 2]

  def init(opts), do: opts

  def call(conn, _opts) do
    admin = get_session(conn, :admin)
    if admin do
      conn
    else
      conn
      |> put_flash(:error, "Login to access this page")
      |> redirect(to: "/")
    end
  end
end
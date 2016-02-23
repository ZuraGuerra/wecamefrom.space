defmodule FromSpace.AuthController do
  use FromSpace.Web, :controller
  alias FromSpace.Admin

  def new(conn, _params) do
    changeset = Admin.changeset(%Admin{})
    render conn, "new.html", changeset: changeset
  end
end
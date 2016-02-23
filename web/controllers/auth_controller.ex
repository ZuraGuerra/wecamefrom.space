defmodule FromSpace.AuthController do
  use FromSpace.Web, :controller
  alias FromSpace.Admin

  def new(conn, %{"admin" => admin_params}) do
    changeset = Admin.changeset(%Admin{}, admin_params)
    render conn, "new.html", changeset: changeset
  end
end
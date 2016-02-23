defmodule FromSpace.AuthController do
  use FromSpace.Web, :controller
  import Ecto.Changeset, only: [cast: 4]
  alias FromSpace.Admin
  alias FromSpace.AuthService

  def new(conn, _params) do
    changeset = Admin.changeset(%Admin{})
    render conn, "new.html", changeset: changeset
  end

  def register(conn, %{"admin" => admin_params}) do
    changeset = Admin.changeset(%Admin{}, admin_params)
    case AuthService.create(changeset) do
      {:ok, admin} ->
        conn
        |> put_session(:admin, admin.id)
        |> put_flash(:info, "Admin created")
        |> redirect(to: "/admin/dashboard")
      _ ->
        conn
        |> put_flash(:error, "Please try again")
        |> redirect(to: "/new")
    end
  end

  def auth(conn, _params) do
    changeset = Admin.changeset(%Admin{})
    render conn, "auth.html", changeset: changeset
  end

  def login(conn, %{"admin" => admin_params}) do
    changeset = cast(%Admin{}, admin_params, ~w(password), ~w())
    case AuthService.login(changeset) do
      {:ok, admin} ->
        conn
        |> put_session(:admin, admin.id)
        |> redirect(to: "/admin/dashboard")
      :no_admin ->
        conn
        |> put_flash(:error, "No admin registered")
        |> redirect(to: "/admin")
      :password_mismatch ->
        conn
        |> put_flash(:error, "Password mismatch")
        |> redirect(to: "/admin")
      _ ->
        conn
        |> put_flash(:error, "Please try again")
        |> redirect(to: "/admin")
    end
  end

  def logout(conn, _params) do
    conn
    |> delete_session(:admin)
    |> put_flash(:info, "Logged out")
    |> redirect(to: "/")
  end
end
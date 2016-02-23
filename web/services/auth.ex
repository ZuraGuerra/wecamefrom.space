defmodule FromSpace.AuthService do
  import Ecto.Changeset, only: [put_change: 3]

  def create_admin(changeset) do
    changeset
    |> put_change(:password, hash_password(changeset.params["password"]))
    |> FromSpace.Repo.insert()
  end

  defp hash_password(password) do
    Comeonin.Bcrypt.hashpwsalt(password)
  end

end
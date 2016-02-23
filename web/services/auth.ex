defmodule FromSpace.AuthService do
  import Ecto.Query
  import Ecto.Changeset, only: [put_change: 3]
  alias FromSpace.{Repo, Admin}

  def create(changeset) do
    changeset
    |> put_change(:password, hash_password(changeset.params["password"]))
    |> Repo.insert()
  end

  defp hash_password(password), do: Comeonin.Bcrypt.hashpwsalt(password)

  defp check_password(password, saved_password) do
    Comeonin.Bcrypt.checkpw(password, saved_password)
  end

  def login(changeset) do
    admin = from admin in Admin,
    select: admin
    admin = Repo.one(admin)
    if !!admin do
      case check_password(changeset.params["password"], admin.password) do
        true -> {:ok, admin}
        false -> :password_mismatch
      end
    else
      :no_admin
    end
  end

end
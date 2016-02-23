defmodule FromSpace.Repo.Migrations.CreateAdmin do
  use Ecto.Migration

  def change do
    create table(:admins) do
      add :name, :string
      add :password, :string
      add :description, :text
      add :avatar, :string

      timestamps
    end

  end
end

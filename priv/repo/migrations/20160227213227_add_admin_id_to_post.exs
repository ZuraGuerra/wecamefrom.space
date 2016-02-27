defmodule FromSpace.Repo.Migrations.AddAdminIdToPost do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :admin_id, references(:admins)
    end
  end
end

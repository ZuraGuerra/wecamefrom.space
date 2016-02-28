defmodule FromSpace.Repo.Migrations.AddTagsToPost do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :tags, :string
    end
  end
end

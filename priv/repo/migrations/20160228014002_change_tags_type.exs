defmodule FromSpace.Repo.Migrations.ChangeTagsType do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      remove :tags 
      add :tags, {:array, :string}
    end
  end
end

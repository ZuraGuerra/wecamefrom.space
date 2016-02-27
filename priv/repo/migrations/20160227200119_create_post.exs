defmodule FromSpace.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :url, :string
      add :preview_image, :string
      add :preview_text, :string
      add :preview_background_color, :string
      add :preview_font_color, :string
      add :html, :text
      add :published, :boolean, default: false

      timestamps
    end

  end
end

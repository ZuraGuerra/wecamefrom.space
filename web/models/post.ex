defmodule FromSpace.Post do
  use FromSpace.Web, :model

  schema "posts" do
    belongs_to :admin, FromSpace.Admin
    field :title, :string
    field :url, :string
    field :preview_image, :string
    field :preview_text, :string
    field :preview_background_color, :string
    field :preview_font_color, :string
    field :html, :string
    field :published, :boolean, default: false

    timestamps
  end

  @required_fields ~w(title url preview_image preview_text preview_background_color preview_font_color html published admin_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end

defmodule FromSpace.Admin do
  use FromSpace.Web, :model

  schema "admins" do
    field :name, :string
    field :password, :string
    field :description, :string
    field :avatar, :string

    timestamps
  end

  @required_fields ~w(name password description avatar)
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

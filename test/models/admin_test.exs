defmodule FromSpace.AdminTest do
  use FromSpace.ModelCase

  alias FromSpace.Admin

  @valid_attrs %{avatar: "some content", description: "some content", name: "some content", password: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Admin.changeset(%Admin{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Admin.changeset(%Admin{}, @invalid_attrs)
    refute changeset.valid?
  end
end

defmodule FromSpace.PostTest do
  use FromSpace.ModelCase

  alias FromSpace.Post

  @valid_attrs %{html: "some content", preview_background_color: "some content", preview_font_color: "some content", preview_image: "some content", preview_text: "some content", published: true, title: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Post.changeset(%Post{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Post.changeset(%Post{}, @invalid_attrs)
    refute changeset.valid?
  end
end

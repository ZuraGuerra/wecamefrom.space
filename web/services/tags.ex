defmodule FromSpace.TagsService do
  import Ecto.Query
  import Ecto.Changeset, only: [put_change: 3, delete_change: 2]
  alias FromSpace.{Repo, Post}

  def tags_to_string(tags) do
    tags
    |> Enum.intersperse(", ")
    |> List.to_string
  end

  def changeset_with_tags(post_params, model \\ %Post{}) do
    virtual_tags = post_params["virtual_tags"]
    tags = String.split(virtual_tags, ~r(,\s))

    changeset = Post.changeset(model, post_params)
                |> delete_change(:virtual_tags)
                |> put_change(:tags, tags)
  end

  
end
defmodule FromSpace.TagsService do
  import Ecto.Query
  import Ecto.Changeset, only: [put_change: 3]
  alias FromSpace.{Repo, Post}

  def tags_to_string(tags) do
    tags
    |> Enum.intersperse(", ")
    |> List.to_string
  end

end
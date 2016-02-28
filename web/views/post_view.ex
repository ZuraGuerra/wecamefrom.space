defmodule FromSpace.PostView do
  use FromSpace.Web, :view
  alias FromSpace.AuthService

  def enumerable_tags(tags) do
    case tags do
      nil -> []
      _ -> String.split(tags, ~r{,\s})
    end
  end
end

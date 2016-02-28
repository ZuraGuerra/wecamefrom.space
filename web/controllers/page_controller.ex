defmodule FromSpace.PageController do
  use FromSpace.Web, :controller
  alias FromSpace.Post

  def index(conn, _params) do
    posts = Post.published_by_creation
    render conn, "index.html", posts: posts
  end
end

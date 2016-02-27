defmodule FromSpace.PageController do
  use FromSpace.Web, :controller
  alias FromSpace.Post

  def index(conn, _params) do
    render conn, "index.html"
  end

  def editor(conn, %{"post_id" => post_id}) do
    post = Repo.get_by(Post, id: post_id)
    changeset = Post.changeset(post)
    render conn, FromSpace.PostView, "edit.html", changeset: changeset, post: post
  end

  def editor(conn, _params) do
    changeset = changeset = Post.changeset(%Post{})
    render conn, FromSpace.PostView, "new.html", changeset: changeset
  end
end

defmodule FromSpace.PostController do
  use FromSpace.Web, :controller
  import Ecto.Changeset, only: [put_change: 3]
  alias FromSpace.TagsService
  alias FromSpace.Post
  
  plug FromSpace.Plug.Auth
  plug :scrub_params, "post" when action in [:create, :update]

  def index(conn, _params) do
    posts = Post.all_by_creation
    render(conn, "index.html", posts: posts)
  end

  def new(conn, _params) do
    changeset = Post.changeset(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    changeset = Post.changeset(%Post{}, post_params)

    case Repo.insert(changeset) do
      {:ok, _post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: post_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"post_url" => post_url}) do
    post = Repo.get_by(Post, url: post_url)
    cond do
      post == nil ->
        conn
        |> put_flash(:error, "This post doesn't exist")
        |> redirect to: "/"
      post.published == true -> render(conn, "show.html", post: post)
      :else ->
        conn
        |> put_flash(:error, "This post doesn't exist")
        |> redirect to: "/"
    end
  end

  def show_by_tag(conn, %{"tag" => tag}) do
    posts = Post.published_with_tag(tag)
    IO.puts posts
    cond do
      posts == [] ->
        conn
        |> put_flash(:error, "No posts about #{tag}")
        |> redirect to: "/"
      posts -> render(conn, "index.html", posts: posts)
    end
  end

  def show(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)
    render(conn, "show.html", post: post)
  end

  def edit(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)
    changeset = Post.changeset(post)
    render(conn, "edit.html", post: post, changeset: changeset, virtual_tags: TagsService.tags_to_string(post.tags))
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Repo.get!(Post, id)
    changeset = Post.changeset(post, post_params)

    case Repo.update(changeset) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: "/admin/dashboard")
      {:error, changeset} ->
        render(conn, "edit.html", post: post, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(post)

    conn
    |> put_flash(:info, "Post deleted successfully.")
    |> redirect(to: post_path(conn, :index))
  end
end

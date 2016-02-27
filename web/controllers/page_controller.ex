defmodule FromSpace.PageController do
  use FromSpace.Web, :controller
  alias FromSpace.Post

  def index(conn, _params) do
    render conn, "index.html"
  end
end

defmodule FromSpace.Router do
  use FromSpace.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FromSpace do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/:post_url", PostController, :show
  end

  scope "/admin", FromSpace do
    pipe_through :browser

    get "/new", AuthController, :new
    post "/register", AuthController, :register
    get "/", AuthController, :auth
    post "/login", AuthController, :login
    get "/logout", AuthController, :logout

    resources "/posts", PostController
    get "/editor", DashboardController, :editor
    get "/editor/:post_id", DashboardController, :editor
    get "/preview/:post_id", DashboardController, :preview
    get "/dashboard", DashboardController, :dashboard
  end

  # Other scopes may use custom stacks.
  # scope "/api", FromSpace do
  #   pipe_through :api
  # end
end

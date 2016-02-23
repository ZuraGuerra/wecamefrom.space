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
  end

  scope "/admin", FromSpace do
    pipe_through :browser

    get "/new", AuthController, :new
    post "/register", AuthController, :register
  end

  # Other scopes may use custom stacks.
  # scope "/api", FromSpace do
  #   pipe_through :api
  # end
end

defmodule ElChat.Router do
  use ElChat.Web, :router

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

  scope "/", ElChat do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/rooms", RoomController, only: ~w(index new create show delete)a
    resources "/registrations", RegistrationController, only: ~w(new create)a

    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete

  end

  # Other scopes may use custom stacks.
  # scope "/api", ElChat do
  #   pipe_through :api
  # end
end

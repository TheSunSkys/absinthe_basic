defmodule MenucardWeb.Router do
  use MenucardWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug(MenucardWeb.Plugs.Context)
  end

  scope "/", MenucardWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  forward "/graphql", Absinthe.Plug.GraphiQL, schema: MenucardWeb.Schema

  scope "/api" do
    pipe_through :api
    forward "/graphql", Absinthe.Plug, schema: MenucardWeb.Schema
  end
end

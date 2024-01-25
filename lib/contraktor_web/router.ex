defmodule ContraktorWeb.Router do
  use ContraktorWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ContraktorWeb do
    pipe_through :api
  end
end

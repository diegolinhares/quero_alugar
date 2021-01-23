defmodule QueroAlugarWeb.Router do
  use QueroAlugarWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/api", Absinthe.Plug, schema: QueroAlugarWeb.Schema.Schema
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: QueroAlugarWeb.Schema.Schema
  end
end

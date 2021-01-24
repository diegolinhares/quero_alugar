defmodule QueroAlugarWeb.Router do
  use QueroAlugarWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    get("/", QueroAlugarWeb.HealthController, :index)
    get("/health", QueroAlugarWeb.HealthController, :index)

    forward "/api", Absinthe.Plug, schema: QueroAlugarWeb.Schema
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: QueroAlugarWeb.Schema
  end
end

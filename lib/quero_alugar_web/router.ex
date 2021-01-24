defmodule QueroAlugarWeb.Router do
  use QueroAlugarWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug QueroAlugarWeb.Plugs.SetCurrentUser
  end

  scope "/" do
    pipe_through :api

    get("/", QueroAlugarWeb.Controllers.HealthController, :index)
    get("/health", QueroAlugarWeb.Controllers.HealthController, :index)

    forward "/api", Absinthe.Plug, schema: QueroAlugarWeb.Schema
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: QueroAlugarWeb.Schema
  end
end

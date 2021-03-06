defmodule QueroAlugarWeb.Schema.Queries.Sessions do
  use Absinthe.Schema.Notation

  alias QueroAlugarWeb.Schema.Resolvers

  object :sessions_queries do
    field :me, :user, description: "Get the currently signed-in user" do
      resolve(&Resolvers.Accounts.me/3)
    end
  end
end

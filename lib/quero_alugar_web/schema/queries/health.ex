defmodule QueroAlugarWeb.Schema.Queries.Health do
  use Absinthe.Schema.Notation

  object :health_queries do
    @desc "Check to see if app is running"
    field :health, :string do
      resolve(fn _, _, _ ->
        {:ok, "health"}
      end)
    end
  end
end

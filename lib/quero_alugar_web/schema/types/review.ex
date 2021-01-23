defmodule QueroAlugarWeb.Schema.Types.Review do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias QueroAlugar.Repo

  object :review do
    field :id, non_null(:id)
    field :rating, non_null(:integer)
    field :comment, non_null(:string)
    field :inserted_at, non_null(:naive_datetime)
    field :user, non_null(:user), resolve: dataloader(Repo)
    field :place, non_null(:place), resolve: dataloader(Repo)
  end
end

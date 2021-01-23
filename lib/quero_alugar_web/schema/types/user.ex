defmodule QueroAlugarWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias QueroAlugar.Repo

  object :user do
    field :username, non_null(:string)
    field :email, non_null(:string)
    field :bookings, list_of(:booking), resolve: dataloader(Repo)
    field :reviews, list_of(:review), resolve: dataloader(Repo)
  end
end

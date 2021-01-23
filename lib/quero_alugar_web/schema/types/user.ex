defmodule QueroAlugarWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1, dataloader: 3]

  alias QueroAlugar.Vacations

  object :user do
    field :username, non_null(:string)
    field :email, non_null(:string)

    field :bookings, list_of(:booking),
      resolve: dataloader(Vacations, :bookings, args: %{scope: :user})

    field :reviews, list_of(:review), resolve: dataloader(Vacations)
  end
end

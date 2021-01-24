defmodule QueroAlugarWeb.Schema.Types.Review do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias QueroAlugar.{Accounts, Vacations}

  object :review do
    field :id, non_null(:id)
    field :rating, non_null(:integer)
    field :comment, non_null(:string)
    field :inserted_at, non_null(:naive_datetime)
    field :user, non_null(:user), resolve: dataloader(Accounts)
    field :place, non_null(:place), resolve: dataloader(Vacations)
  end

  input_object :input_review do
    field(:place_id, non_null(:id))
    field(:comment, :string)
    field(:rating, non_null(:integer))
  end
end

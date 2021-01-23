defmodule QueroAlugarWeb.Schema do
  use Absinthe.Schema

  import_types(QueroAlugarWeb.Schema.Types)

  alias QueroAlugarWeb.Resolvers

  query do
    @desc "Get a place by its slug"
    field :get_place_by_slug, :place do
      arg(:slug, non_null(:string))

      resolve(&Resolvers.Vacations.get_place_by_slug/3)
    end

    @desc "Get a list of places"
    field :list_all_places, list_of(:place) do
      arg(:limit, :integer)
      arg(:order, type: :sort_order, default_value: :asc)
      arg(:filter, :place_filter)

      resolve(&Resolvers.Vacations.list_places/3)
    end
  end
end

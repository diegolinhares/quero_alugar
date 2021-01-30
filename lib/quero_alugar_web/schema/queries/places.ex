defmodule QueroAlugarWeb.Schema.Queries.Places do
  use Absinthe.Schema.Notation

  alias QueroAlugarWeb.Schema.Resolvers

  object :places_queries do
    @desc "Get a place by its slug"
    field :get_place_by_slug, :place do
      arg(:slug, non_null(:string))

      resolve(&Resolvers.Places.get_by_slug/3)
    end

    @desc "Get a list of places"
    field :list_all_places, list_of(:place) do
      arg(:limit, :integer)
      arg(:offset, :integer)
      arg(:order, type: :sort_order, default_value: :asc)
      arg(:filter, :place_filter)

      resolve(&Resolvers.Places.list/3)
    end
  end
end

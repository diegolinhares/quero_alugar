defmodule QueroAlugarWeb.Schema do
  use Absinthe.Schema

  import_types(QueroAlugarWeb.Schema.Types)

  alias QueroAlugar.{Accounts, Vacations}
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

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Vacations, Vacations.datasource())
      |> Dataloader.add_source(Accounts, Accounts.datasource())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end
end

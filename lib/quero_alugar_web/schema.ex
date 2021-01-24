defmodule QueroAlugarWeb.Schema do
  use Absinthe.Schema

  import_types(QueroAlugarWeb.Schema.Types)
  import_types(QueroAlugarWeb.Queries.Places)
  import_types(QueroAlugarWeb.Mutations.Bookings)
  import_types(QueroAlugarWeb.Mutations.Reviews)

  query do
    import_fields(:places_queries)
  end

  mutation do
    import_fields(:bookings_mutations)
    import_fields(:reviews_mutations)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end

  def dataloader() do
    alias QueroAlugar.{Accounts, Vacations}

    Dataloader.new()
    |> Dataloader.add_source(Vacations, Vacations.datasource())
    |> Dataloader.add_source(Accounts, Accounts.datasource())
  end

  def context(ctx) do
    ctx = Map.put(ctx, :current_user, Accounts.get_user(1))

    Map.put(ctx, :loader, dataloader())
  end
end

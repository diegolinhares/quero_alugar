defmodule QueroAlugarWeb.Schema do
  alias QueroAlugar.{Accounts, Vacations}

  use Absinthe.Schema

  import AbsintheErrorPayload.Payload

  import_types(AbsintheErrorPayload.ValidationMessageTypes)

  import_types(QueroAlugarWeb.Schema.Types)
  import_types(QueroAlugarWeb.Schema.Queries.Health)
  import_types(QueroAlugarWeb.Schema.Queries.Places)
  import_types(QueroAlugarWeb.Schema.Queries.Sessions)
  import_types(QueroAlugarWeb.Schema.Mutations.Bookings)
  import_types(QueroAlugarWeb.Schema.Mutations.Reviews)
  import_types(QueroAlugarWeb.Schema.Mutations.Accounts)

  payload_object(:booking_payload, :booking)
  payload_object(:review_payload, :review)
  payload_object(:account_payload, :session)

  query do
    import_fields(:health_queries)
    import_fields(:places_queries)
    import_fields(:sessions_queries)
  end

  mutation do
    import_fields(:bookings_mutations)
    import_fields(:reviews_mutations)
    import_fields(:accounts_mutations)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]
  end

  # Use the build_payload from AbsintheErrorPayload to all mutations
  def middleware(middleware, _field, %Absinthe.Type.Object{identifier: :mutation}) do
    middleware ++ [&build_payload/2]
  end

  def middleware(middleware, _field, _object) do
    middleware
  end

  def dataloader() do
    Dataloader.new()
    |> Dataloader.add_source(Vacations, Vacations.datasource())
    |> Dataloader.add_source(Accounts, Accounts.datasource())
  end

  def context(ctx) do
    Map.put(ctx, :loader, dataloader())
  end
end

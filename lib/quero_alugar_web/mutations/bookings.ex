defmodule QueroAlugarWeb.Mutations.Bookings do
  use Absinthe.Schema.Notation

  alias QueroAlugarWeb.Resolvers
  alias QueroAlugarWeb.Schema.Middleware.Authenticate

  import AbsintheErrorPayload.Payload

  object :bookings_mutations do
    @desc "Create a booking for a place"
    field :create_booking, :booking_payload do
      arg(:input, :booking_input)

      middleware(Authenticate)
      resolve(&Resolvers.Bookings.create/3)
    end

    @desc "Cancel a booking"
    field :cancel_booking, :booking_payload do
      arg(:booking_id, non_null(:id))

      middleware(Authenticate)
      resolve(&Resolvers.Bookings.cancel/3)
    end
  end
end

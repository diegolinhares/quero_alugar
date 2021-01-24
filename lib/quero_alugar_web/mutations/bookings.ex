defmodule QueroAlugarWeb.Mutations.Bookings do
  use Absinthe.Schema.Notation

  alias QueroAlugarWeb.Resolvers

  import AbsintheErrorPayload.Payload

  object :bookings_mutations do
    @desc "Create a booking for a place"
    field :create_booking, :booking_payload do
      arg(:input, :booking_input)

      resolve(&Resolvers.Bookings.create/3)
      middleware(&build_payload/2)
    end

    @desc "Cancel a booking"
    field :cancel_booking, :booking_payload do
      arg(:booking_id, non_null(:id))

      resolve(&Resolvers.Bookings.cancel/3)
      middleware(&build_payload/2)
    end
  end
end

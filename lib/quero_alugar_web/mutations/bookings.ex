defmodule QueroAlugarWeb.Mutations.Bookings do
  use Absinthe.Schema.Notation

  alias QueroAlugarWeb.Resolvers

  object :bookings_mutations do
    @desc "Create a booking for a place"
    field :create_booking, :booking do
      arg(:place_id, non_null(:id))
      arg(:start_date, non_null(:date))
      arg(:end_date, non_null(:date))

      resolve(&Resolvers.Bookings.create/3)
    end

    @desc "Cancel a booking"
    field :cancel_booking, :booking do
      arg(:booking_id, non_null(:id))

      resolve(&Resolvers.Bookings.cancel/3)
    end
  end
end

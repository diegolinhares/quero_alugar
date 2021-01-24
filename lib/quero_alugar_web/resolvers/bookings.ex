defmodule QueroAlugarWeb.Resolvers.Bookings do
  alias QueroAlugar.Vacations

  def create(_, args, %{context: %{current_user: user}}) do
    case Vacations.create_booking(user, args[:input]) do
      {:error, changeset} ->
        {:error, changeset}

      {:ok, booking} ->
        {:ok, booking}
    end
  end

  def cancel(_, args, %{context: %{current_user: user}}) do
    booking = Vacations.get_booking!(args[:booking_id])

    if booking.user_id == user.id do
      case Vacations.cancel_booking(booking) do
        {:error, changeset} ->
          {:error, changeset}

        {:ok, booking} ->
          {:ok, booking}
      end
    else
      {:error, message: "Hey, thats not your booking"}
    end
  end
end

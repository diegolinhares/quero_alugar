defmodule QueroAlugar.Vacation.Place do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [
    :name,
    :slug,
    :description,
    :location,
    :price_per_night,
    :image,
    :image_thumbmail
  ]
  @optional_fields [:max_guests, :pet_friendly, :pool, :wifi]

  schema "places" do
    field :description, :string
    field :image, :string
    field :image_thumbmail, :string
    field :location, :string
    field :max_guests, :integer, default: 2
    field :name, :string
    field :pet_friendly, :boolean, default: false
    field :pool, :boolean, default: false
    field :price_per_night, :decimal
    field :slug, :string
    field :wifi, :boolean, default: false

    has_many :bookings, QueroAlugar.Vacations.Booking

    timestamps()
  end

  @doc false
  def changeset(place, attrs) do
    place
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:name)
    |> unique_constraint(:slug)
  end
end

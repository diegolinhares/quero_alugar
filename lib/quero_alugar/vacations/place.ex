defmodule QueroAlugar.Vacations.Place do
  use Ecto.Schema
  import Ecto.Changeset

  alias QueroAlugar.Vacations.{Booking, Review}

  @required_fields [
    :name,
    :slug,
    :description,
    :location,
    :price_per_night,
    :image,
    :image_thumbnail
  ]
  @optional_fields [:max_guests, :pet_friendly, :pool, :wifi]

  schema "places" do
    field :description, :string
    field :image, :string
    field :image_thumbnail, :string
    field :location, :string
    field :max_guests, :integer, default: 2
    field :name, :string
    field :pet_friendly, :boolean, default: false
    field :pool, :boolean, default: false
    field :price_per_night, :decimal
    field :slug, :string
    field :wifi, :boolean, default: false

    has_many :bookings, Booking
    has_many :reviews, Review

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

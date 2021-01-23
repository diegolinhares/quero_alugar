defmodule QueroAlugar.Vacations.Review do
  use Ecto.Schema
  import Ecto.Changeset

  alias QueroAlugar.Vacations.Place
  alias QueroAlugar.Accounts.User

  @required_fields [:rating, :comment, :place]

  schema "reviews" do
    field :comment, :string
    field :rating, :integer

    belongs_to :place, Place
    belongs_to :user, User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(review, attrs) do
    review
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> assoc_constraint(:place)
    |> assoc_constraint(:user)
  end
end

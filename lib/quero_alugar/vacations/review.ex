defmodule QueroAlugar.Vacations.Review do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [:rating, :comment, :place]

  schema "review" do
    field :comment, :string
    field :rating, :integer
    
    belongs_to :place, QueroAlugar.Vacations.Place
    belongs_to :user, QueroAlugar.Accounts.User

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

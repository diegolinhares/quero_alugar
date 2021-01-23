defmodule QueroAlugar.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [:username, :email, :password]

  schema "user" do
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :username, :string

    has_many :bookings, QueroAlugar.Vacations.Booking
    has_many :reviews, QueroAlugar.Vacations.Review

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:username, min: 2)
    |> validate_length(:password, min: 6)
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> hash_password()
  end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(password))

      _ ->
        changeset
    end
  end
end

defmodule QueroAlugar.Repo.Migrations.CreateReview do
  use Ecto.Migration

  def change do
    create table(:review) do
      add :rating, :integer, null: false
      add :comment, :string, null: false
      add :place_id, references(:places, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:review, [:place_id])
    create index(:review, [:user_id])
  end
end

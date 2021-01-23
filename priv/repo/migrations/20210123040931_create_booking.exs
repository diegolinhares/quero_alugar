defmodule QueroAlugar.Repo.Migrations.CreateBooking do
  use Ecto.Migration

  def change do
    create table(:booking) do
      add :start_date, :date, null: false
      add :end_date, :date, null: false
      add :state, :string, null: false
      add :total_price, :decimal
      add :place_id, references(:places, on_delete: :nothing), null: false
      add :user_id, references(:users, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:booking, [:place_id])
    create index(:booking, [:user_id])
  end
end

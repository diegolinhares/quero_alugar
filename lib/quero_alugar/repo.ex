defmodule QueroAlugar.Repo do
  use Ecto.Repo,
    otp_app: :quero_alugar,
    adapter: Ecto.Adapters.Postgres
end

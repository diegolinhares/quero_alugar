defmodule QueroAlugarWeb.Resolvers.Places do
  alias QueroAlugar.Vacations

  def get_by_slug(_, %{slug: slug}, _) do
    {:ok, Vacations.get_place_by_slug!(slug)}
  end

  def list(_, args, _) do
    {:ok, Vacations.list_places(args)}
  end
end

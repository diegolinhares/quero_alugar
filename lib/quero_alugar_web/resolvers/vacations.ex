defmodule QueroAlugarWeb.Resolvers.Vacations do
  alias QueroAlugar.Vacations

  def get_place_by_slug(_, %{slug: slug}, _) do
    {:ok, Vacations.get_place_by_slug!(slug)}
  end

  def list_places(_, args, _) do
    {:ok, Vacations.list_places(args)}
  end
end

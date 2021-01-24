defmodule QueroAlugarWeb.Resolvers.Reviews do
  alias QueroAlugar.Vacations

  def create(_, args, %{context: %{current_user: user}}) do
    case Vacations.create_review(user, args[:input]) do
      {:error, changeset} ->
        {:error, changeset}

      {:ok, review} ->
        {:ok, review}
    end
  end
end

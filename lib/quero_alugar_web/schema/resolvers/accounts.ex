defmodule QueroAlugarWeb.Schema.Resolvers.Accounts do
  alias QueroAlugar.Accounts
  alias QueroAlugarWeb.Helpers.AuthToken

  def create(_, args, _) do
    case Accounts.create_user(args[:input]) do
      {:error, changeset} ->
        {:error, changeset}

      {:ok, user} ->
        {:ok, %{user: user, token: AuthToken.sign(user)}}
    end
  end

  def sign_in(_, args, _) do
    %{username: username, password: password} = args[:input]

    case Accounts.authenticate(username, password) do
      :error ->
        {:error, "Invalid credentials"}

      {:ok, user} ->
        {:ok, %{user: user, token: AuthToken.sign(user)}}
    end
  end

  def me(_, _, %{context: %{current_user: user}}) do
    {:ok, user}
  end

  def me(_, _, _) do
    {:ok, nil}
  end
end

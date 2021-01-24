defmodule QueroAlugarWeb.Helpers.AuthToken do
  @user_salt "user auth salt"

  def sign(user) do
    Phoenix.Token.sign(QueroAlugarWeb.Endpoint, @user_salt, %{id: user.id})
  end
end

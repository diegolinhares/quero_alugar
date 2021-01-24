defmodule QueroAlugarWeb.Schema.Types.Account do
  use Absinthe.Schema.Notation

  object :session do
    field :user, non_null(:user)
    field :token, non_null(:string)
  end

  input_object :account_input do
    field(:username, non_null(:string))
    field(:email, non_null(:string))
    field(:password, non_null(:string))
  end

  input_object :session_input do
    field(:username, non_null(:string))
    field(:password, non_null(:string))
  end
end

defmodule QueroAlugarWeb.Mutations.Accounts do
  use Absinthe.Schema.Notation

  alias QueroAlugarWeb.Resolvers

  import AbsintheErrorPayload.Payload

  object :accounts_mutations do
    field :sign_up, :account_payload do
      arg(:input, :account_input)

      resolve(&Resolvers.Accounts.create/3)
    end

    field :sign_in, :account_payload do
      arg(:input, :session_input)

      resolve(&Resolvers.Accounts.sign_in/3)
    end
  end
end

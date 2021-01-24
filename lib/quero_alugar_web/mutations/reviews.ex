defmodule QueroAlugarWeb.Mutations.Reviews do
  use Absinthe.Schema.Notation

  alias QueroAlugarWeb.Resolvers

  import AbsintheErrorPayload.Payload

  object :reviews_mutations do
    @desc "Create a review for a place"
    field :create_review, :review_payload do
      arg(:input, :input_review)

      resolve(&Resolvers.Reviews.create/3)
      middleware(&build_payload/2)
    end
  end
end

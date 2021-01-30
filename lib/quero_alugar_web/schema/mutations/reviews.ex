defmodule QueroAlugarWeb.Schema.Mutations.Reviews do
  use Absinthe.Schema.Notation

  alias QueroAlugarWeb.Schema.Resolvers
  alias QueroAlugarWeb.Middleware.Authenticate

  object :reviews_mutations do
    @desc "Create a review for a place"
    field :create_review, :review_payload do
      arg(:input, :input_review)

      middleware(Authenticate)
      resolve(&Resolvers.Reviews.create/3)
    end
  end
end

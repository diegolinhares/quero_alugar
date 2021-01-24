defmodule QueroAlugarWeb.Mutations.Reviews do
  use Absinthe.Schema.Notation

  alias QueroAlugarWeb.Resolvers

  object :reviews_mutations do
    @desc "Create a review for a place"
    field :create_review, :review do
      arg(:place_id, non_null(:id))
      arg(:comment, :string)
      arg(:rating, non_null(:integer))

      resolve(&Resolvers.Reviews.create/3)
    end
  end
end

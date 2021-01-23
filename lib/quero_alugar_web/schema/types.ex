defmodule QueroAlugarWeb.Schema.Types do
  use Absinthe.Schema.Notation

  import_types(Absinthe.Type.Custom)

  alias QueroAlugarWeb.Schema.Types

  import_types(Types.Place)

  enum :sort_order do
    value(:asc)
    value(:desc)
  end
end

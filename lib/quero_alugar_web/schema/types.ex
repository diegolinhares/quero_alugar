defmodule QueroAlugarWeb.Schema.Types do
  use Absinthe.Schema.Notation

  import_types(Absinthe.Type.Custom)

  alias QueroAlugarWeb.Schema.Types

  import_types(Types.User)
  import_types(Types.Place)
  import_types(Types.Booking)
  import_types(Types.Review)

  enum :sort_order do
    value(:asc)
    value(:desc)
  end
end

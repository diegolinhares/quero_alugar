defmodule QueroAlugarWeb.Schema.Types do
  use Absinthe.Schema.Notation

  import_types(Absinthe.Type.Custom)

  alias QueroAlugarWeb.Schema.Types

  import_types(Types.Place)
end

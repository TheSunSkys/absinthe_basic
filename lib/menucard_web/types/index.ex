defmodule MenucardWeb.Types.Index do
  use Absinthe.Schema.Notation

  alias MenucardWeb.Types.{
    UserType
  }

  import_types(UserType)
end

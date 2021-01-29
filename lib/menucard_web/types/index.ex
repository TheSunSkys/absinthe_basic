defmodule MenucardWeb.Types.Index do
  use Absinthe.Schema.Notation

  alias MenucardWeb.Types.{
    UserType,
    PostType
  }

  import_types(UserType)
  import_types(PostType)
end

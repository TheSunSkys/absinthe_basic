defmodule MenucardWeb.Types.UserType do
  use Absinthe.Schema.Notation

  @desc "User"
  object :user do
    field(:id, :id)
    field(:username, :string)
    field(:name, :string)
  end

  @desc "User input"
  input_object :user_input do
    field(:username, non_null(:string))
    field(:name, non_null(:string))
    field(:password, non_null(:string))
  end

  @desc "Session"
  object :session do
    field(:token, :string)
    field(:user, :user)
  end

  @desc "Session input"
  input_object :session_input do
    field(:username, non_null(:string))
    field(:password, non_null(:string))
  end
end

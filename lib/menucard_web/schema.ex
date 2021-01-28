defmodule MenucardWeb.Schema do
  use Absinthe.Schema
  alias Menucard.Menu
  alias Menucard.Account
  alias Bcrypt
  alias MenucardWeb.Middleware

  def hash_password(password), do: Bcrypt.hash_pwd_salt(password)

  @desc "An item"
  object :item do
    field(:id, :id)
    field(:name, :string)
    field(:price, :integer)
    field(:reviews, list_of(:review))
  end

  @desc "Review for an item"
  object :review do
    field(:id, :id)
    field(:comment, :string)
    field(:author_id, :integer)
  end

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

  query do
    field :item, :item do
      arg(:id, non_null(:id))

      resolve(fn args, _ ->
        {:ok, Menu.get_item_with_review(args)}
      end)
    end

    field :user, :user do
      arg(:username, non_null(:string))

      middleware(Middleware.Authorize, "")

      # get current user
      resolve(fn _, args, %{context: %{current_user: current_user}} ->
        current_user |> IO.inspect()
        {:ok, Account.get_user_by_username!(args.username)}
      end)
    end
  end

  mutation do
    field :login_user, :session do
      arg(:input, non_null(:session_input))

      resolve(fn _, %{input: input}, _ ->
        Account.Session.authenticate(input)
      end)
    end

    field :create_user, :user do
      arg(:input, non_null(:user_input))

      resolve(fn _, %{input: input}, _ ->
        Account.create_user(Map.merge(input, %{password: input.password |> hash_password()}))
      end)
    end

    field :create_item, :item do
      arg(:name, non_null(:string))
      arg(:price, non_null(:integer))

      resolve(fn args, _ ->
        Menu.create_item(args)
      end)
    end

    field :do_review, :review do
      arg(:comment, non_null(:string))
      arg(:author_id, non_null(:id))
      arg(:item_id, non_null(:id))

      resolve(fn args, _ ->
        Menu.create_review(args)
      end)
    end
  end
end

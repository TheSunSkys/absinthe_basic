defmodule MenucardWeb.Schema do
  use Absinthe.Schema
  alias Menucard.Menu
  alias Menucard.Account
  alias Bcrypt

  def hash_password(password), do: Bcrypt.hash_pwd_salt(password)
  def validate_password(password, hash), do: Bcrypt.verify_pass(password, hash)

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

  query do
    field :item, :item do
      arg(:id, non_null(:id))

      resolve(fn args, _ ->
        {:ok, Menu.get_item_with_review(args)}
      end)
    end
  end

  mutation do
    field :create_user, :user do
      arg(:name, non_null(:string))
      arg(:username, non_null(:string))
      arg(:password, non_null(:string))

      resolve(fn args, _ ->
        Account.create_user(Map.merge(args, %{password: args.password |> hash_password()}))
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

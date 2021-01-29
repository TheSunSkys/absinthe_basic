defmodule MenucardWeb.Schema do
  use Absinthe.Schema
  alias MenucardWeb.Middleware

  alias MenucardWeb.Resolvers

  import_types(MenucardWeb.Types.Index)

  # @desc "An item"
  # object :item do
  #   field(:id, :id)
  #   field(:name, :string)
  #   field(:price, :integer)
  #   field(:reviews, list_of(:review))
  # end

  # @desc "Review for an item"
  # object :review do
  #   field(:id, :id)
  #   field(:comment, :string)
  #   field(:author_id, :integer)
  # end

  query do
    # field :item, :item do
    #   arg(:id, non_null(:id))

    #   resolve(fn args, _ ->
    #     {:ok, Menu.get_item_with_review(args)}
    #   end)
    # end

    field :user, :user do
      arg(:username, non_null(:string))
      middleware(Middleware.Authorize, "")
      resolve(&Resolvers.UserResolver.get_user_by_username/3)
    end
  end

  mutation do
    field :login_user, :session do
      arg(:input, non_null(:session_input))
      resolve(&Resolvers.UserResolver.login_user/3)
    end

    field :create_user, type: :user do
      arg(:input, non_null(:user_input))
      resolve(&Resolvers.UserResolver.create_user/3)
    end

    # field :create_item, :item do
    #   arg(:name, non_null(:string))
    #   arg(:price, non_null(:integer))

    #   resolve(fn args, _ ->
    #     Menu.create_item(args)
    #   end)
    # end

    # field :do_review, :review do
    #   arg(:comment, non_null(:string))
    #   arg(:author_id, non_null(:id))
    #   arg(:item_id, non_null(:id))

    #   resolve(fn args, _ ->
    #     Menu.create_review(args)
    #   end)
    # end
  end
end

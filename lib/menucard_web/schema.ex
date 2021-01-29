defmodule MenucardWeb.Schema do
  use Absinthe.Schema
  alias MenucardWeb.Middleware

  alias MenucardWeb.Resolvers

  import_types(MenucardWeb.Types.Index)

  query do
    field :user, :user do
      arg(:username, non_null(:string))
      middleware(Middleware.Authorize, "")
      resolve(&Resolvers.UserResolver.get_user_by_username/3)
    end

    field :posts, list_of(:post) do
      middleware(Middleware.Authorize, "")
      resolve(&Resolvers.PostResolver.get_post_list/3)
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

    field :create_post, type: :post do
      arg(:input, non_null(:post_input))
      middleware(Middleware.Authorize, "")
      resolve(&Resolvers.PostResolver.create_post/3)
    end
  end
end

defmodule MenucardWeb.Schema do
  use Absinthe.Schema

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

  query do
    field :item, :item do
      arg(:id, non_null(:id))

      resolve(fn args, _ ->
        new_id = args.id
        {:ok, Menucard.Menu.get_item!(new_id)}
      end)
    end
  end

  mutation do
    field :create_item, :item do
      arg(:name, non_null(:string))
      arg(:price, non_null(:integer))

      resolve(fn args, _ ->
        {:ok, %Menucard.Menu.Item{} = data} = Menucard.Menu.create_item(args)
        {:ok, data}
      end)
    end
  end
end

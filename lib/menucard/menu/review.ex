defmodule Menucard.Menu.Review do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reviews" do
    field :author_id, :integer
    field :comment, :string
    # field :item_id, :id

    belongs_to(:item, MenuCard.Menu.Item)

    timestamps()
  end

  @doc false
  def changeset(review, attrs) do
    review
    |> cast(attrs, [:comment, :author_id, :item_id])
    |> validate_required([:comment, :author_id, :item_id])
  end
end

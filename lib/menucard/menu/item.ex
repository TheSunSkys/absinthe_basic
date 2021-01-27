defmodule Menucard.Menu.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :name, :string
    field :price, :integer

    has_many(:reviews, Menucard.Menu.Review)

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :price])
    |> validate_required([:name, :price])
  end
end

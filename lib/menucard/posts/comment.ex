defmodule Menucard.Posts.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :comment, :string
    # field :author_id, :id
    # field :post_id, :id

    belongs_to(:post, Menucard.Posts.Post)
    belongs_to(:author, Menucard.Account.User)

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:comment, :author_id, :post_id])
    |> validate_required([:comment, :author_id, :post_id])
  end
end

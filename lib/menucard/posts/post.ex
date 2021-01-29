defmodule Menucard.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :content, :string
    field :title, :string

    belongs_to(:author, Menucard.Account.User)
    has_many(:commens, Menucard.Posts.Comment)

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:content, :title, :author_id])
    |> validate_required([:content, :title, :author_id])
  end
end

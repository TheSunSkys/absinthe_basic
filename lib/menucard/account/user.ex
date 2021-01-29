defmodule Menucard.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :name, :string
    field :password, :string
    field :username, :string

    has_many(:posts, Menucard.Posts.Post)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :name, :password])
    |> validate_required([:username, :name, :password])
  end
end

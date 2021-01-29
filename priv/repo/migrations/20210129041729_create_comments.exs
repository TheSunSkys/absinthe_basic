defmodule Menucard.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :comment, :string
      add :author_id, references(:user, on_delete: :nothing)
      add :post_id, references(:posts, on_delete: :nothing)

      timestamps()
    end

    create index(:comments, [:author_id])
    create index(:comments, [:post_id])
  end
end

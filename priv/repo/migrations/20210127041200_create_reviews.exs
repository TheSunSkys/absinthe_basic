defmodule Menucard.Repo.Migrations.CreateReviews do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      add :comment, :string
      add :author_id, :integer
      add :item_id, references(:items, on_delete: :nothing)

      timestamps()
    end

    create index(:reviews, [:item_id])
  end
end

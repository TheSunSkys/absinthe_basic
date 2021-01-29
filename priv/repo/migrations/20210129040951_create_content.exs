defmodule Menucard.Repo.Migrations.CreateContent do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :content, :string
      add :title, :string
      add :author_id, references(:user, on_delete: :nothing)

      timestamps()
    end

  end
end

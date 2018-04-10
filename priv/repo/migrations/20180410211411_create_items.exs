defmodule Next.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add(:title, :string)
      add(:description, :string)
      add(:url, :string)
      add(:url_meta, :map)
      add(:show_id, references(:shows, on_delete: :nothing))

      timestamps()
    end

    create(index(:items, [:show_id]))
  end
end

defmodule Next.Repo.Migrations.CreateShows do
  use Ecto.Migration

  def change do
    create table(:shows) do
      add :name, :string
      add :subtitle, :text
      add :description, :text
      add :recording_date, :utc_datetime
      add :logo_url, :string
      add :channel_id, references(:channels, on_delete: :nothing)

      timestamps()
    end

    create index(:shows, [:channel_id])
  end
end

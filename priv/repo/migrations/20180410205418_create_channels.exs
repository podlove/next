defmodule Next.Repo.Migrations.CreateChannels do
  use Ecto.Migration

  def change do
    create table(:channels) do
      add :name, :string
      add :network_id, references(:networks, on_delete: :nothing)

      timestamps()
    end

    create index(:channels, [:network_id])
  end
end

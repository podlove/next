defmodule Next.Repo.Migrations.CreateNetworks do
  use Ecto.Migration

  def change do
    create table(:networks) do
      add :name, :string

      timestamps()
    end

  end
end

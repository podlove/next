defmodule Next.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:email, :text)
      add(:password, :string)

      timestamps()
    end

    create(unique_index(:users, [:email]))
  end
end

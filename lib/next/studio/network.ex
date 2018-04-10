defmodule Next.Studio.Network do
  use Ecto.Schema
  import Ecto.Changeset

  schema "networks" do
    field(:name, :string)

    timestamps()
  end

  @doc false
  def changeset(network, attrs) do
    network
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end

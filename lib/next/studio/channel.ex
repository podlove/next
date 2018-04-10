defmodule Next.Studio.Channel do
  use Ecto.Schema
  import Ecto.Changeset
  alias Next.Studio.Network

  schema "channels" do
    field(:name, :string)
    # field(:network_id, :id)

    belongs_to(:network, Network)

    timestamps()
  end

  @doc false
  def changeset(channel, attrs) do
    channel
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end

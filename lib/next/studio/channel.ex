defmodule Next.Studio.Channel do
  use Ecto.Schema
  import Ecto.Changeset
  alias Next.Studio.{Network, Show}

  schema "channels" do
    field(:name, :string)

    belongs_to(:network, Network)
    has_many(:shows, Show)

    timestamps()
  end

  @doc false
  def changeset(channel, attrs) do
    channel
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end

defmodule Next.Studio.Network do
  @moduledoc """
  Schema for networks.

  A network is the top level of organization structure. 
  Networks contain one or many `Next.Studio.Channel` (podcasts). Every Channel belongs to a Network.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Next.Studio.Channel

  schema "networks" do
    field(:name, :string)

    has_many(:channels, Channel)

    timestamps()
  end

  @doc false
  def changeset(network, attrs) do
    network
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end

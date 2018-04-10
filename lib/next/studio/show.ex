defmodule Next.Studio.Show do
  use Ecto.Schema
  import Ecto.Changeset
  alias Next.Studio.Channel

  schema "shows" do
    field(:description, :string)
    field(:logo_url, :string)
    field(:name, :string)
    field(:recording_date, :utc_datetime)
    field(:subtitle, :string)
    # field :channel_id, :id

    belongs_to(:channel, Channel)

    timestamps()
  end

  @doc false
  def changeset(show, attrs) do
    show
    |> cast(attrs, [:name, :subtitle, :description, :recording_date, :logo_url])
    |> validate_required([:name, :subtitle, :description, :recording_date, :logo_url])
  end
end

defmodule Next.Studio.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field(:description, :string)
    field(:title, :string)
    field(:url, :string)
    field(:url_meta, :map)
    field(:show_id, :id)

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:title, :description, :url, :url_meta])
    |> validate_required([:title, :description, :url, :url_meta])
  end
end

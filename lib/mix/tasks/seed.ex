defmodule Mix.Tasks.Next.Seed do
  use Mix.Task

  alias Next.Repo
  alias Next.Studio

  @shortdoc "Seeds project with data for easier development"

  @moduledoc """
  See shortdoc :P
  """

  def run(_args) do
    Mix.shell().info("Starting app")
    Mix.Task.run("app.start")

    Mix.shell().info("Seeding data")
    {:ok, studio} = Studio.create_network(%{name: "Metaebene"})

    {:ok, channel_lnp} =
      studio
      |> Ecto.build_assoc(:channels, %{name: "Logbuch:Netzpolitik"})
      |> Repo.insert()

    {:ok, _channel_fg} =
      studio
      |> Ecto.build_assoc(:channels, %{name: "Forschergeist"})
      |> Repo.insert()

    {:ok, _channel_nsfw} =
      studio
      |> Ecto.build_assoc(:channels, %{name: "Not Safe For Work"})
      |> Repo.insert()

    {:ok, show_lnp001} =
      channel_lnp
      |> Ecto.build_assoc(:shows, %{name: "LNP001 State of the Union"})
      |> Repo.insert()

    {:ok, _show_lnp002} =
      channel_lnp
      |> Ecto.build_assoc(:shows, %{name: "LNP002 WikiLeaks und Schultrojaner"})
      |> Repo.insert()

    show_lnp001
    |> Ecto.build_assoc(:items, %{
      title: "Digitale Gesellschaft e.V.",
      url: "https://netzpolitik.org/2011/npp110-netzaktivismus-und-digitale-gesellschaft-e-v/"
    })
    |> Repo.insert()

    show_lnp001
    |> Ecto.build_assoc(:items, %{
      title: "Die Datenfresser",
      url:
        "http://www.amazon.de/gp/product/3100485181/ref=as_li_ss_tl?ie=UTF8&tag=logbuch-netzpolitik-21&linkCode=as2&camp=1638&creative=19454&creativeASIN=3100485181"
    })
    |> Repo.insert()

    show_lnp001
    |> Ecto.build_assoc(:items, %{
      title:
        "netzpolitik.org: Die dmexco überleben: Survival in der Einöde des Digital Marketing.",
      url:
        "https://netzpolitik.org/2011/die-dmexco-uberleben-survival-in-der-einode-des-digital-marketing/"
    })
    |> Repo.insert()

    # Mix.shell().info(inspect(channel))

    Mix.shell().info("Done :)")
  end
end

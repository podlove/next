defmodule Mix.Tasks.Next.Reset do
  use Mix.Task

  alias Next.Studio

  @shortdoc "Empties database and seeds project with data for easier development"

  @moduledoc """
  See shortdoc :P
  """

  def run(_args) do
    Mix.Task.run("ecto.drop")
    Mix.Task.run("ecto.create")
    Mix.Task.run("ecto.migrate")
    Mix.Task.run("next.seed")
  end
end

defmodule Next do
  @moduledoc """
  A playground for the Podlove NG Core.

  ## Current Functionality

  - Basic Register/Login
  - Basic Ecto Schemas

  ## Schemas

  The top level entity is `Next.Studio.Network`. A network contains one or many `Next.Studio.Channel` (podcasts).
  Each channel contains `Next.Studio.Show` (episodes), which contain many `Next.Studio.Item`.
  """
end

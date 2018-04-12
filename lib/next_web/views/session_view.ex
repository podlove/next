defmodule NextWeb.SessionView do
  use NextWeb, :view

  import Phoenix.Controller, only: [get_csrf_token: 0]
end

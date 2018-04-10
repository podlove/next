defmodule NextWeb.PageController do
  use NextWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

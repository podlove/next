defmodule NextWeb.Router do
  use NextWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :browser_session do
    plug(Next.AuthAccessPipeline)
    plug(Next.Plug.SetCurrentUser)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", NextWeb do
    pipe_through([:browser, :browser_session])

    get("/", PageController, :index)

    get("/login", SessionController, :new)
    post("/login", SessionController, :create)
    get("/logout", SessionController, :destroy)

    get("/register", RegistrationController, :new)
    post("/register", RegistrationController, :create)
  end
end

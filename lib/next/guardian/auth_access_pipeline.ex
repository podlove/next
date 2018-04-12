defmodule Next.AuthAccessPipeline do
  use Guardian.Plug.Pipeline, otp_app: :next

  plug(Guardian.Plug.VerifySession)
  plug(Guardian.Plug.VerifyHeader)
  # plug Guardian.Plug.EnsureAuthenticated
  plug(Guardian.Plug.LoadResource, allow_blank: true)
end

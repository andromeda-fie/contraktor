defmodule Contraktor.Repo do
  use Ecto.Repo,
    otp_app: :contraktor,
    adapter: Ecto.Adapters.Postgres
end

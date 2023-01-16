defmodule Yindlo.Repo do
  use Ecto.Repo,
    otp_app: :yindlo,
    adapter: Ecto.Adapters.Postgres
end

defmodule DrinksCatalog.Repo do
  use Ecto.Repo,
    otp_app: :drinks_catalog,
    adapter: Ecto.Adapters.Postgres
end

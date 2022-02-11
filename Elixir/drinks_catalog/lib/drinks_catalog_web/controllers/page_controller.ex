defmodule DrinksCatalogWeb.PageController do
  use DrinksCatalogWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

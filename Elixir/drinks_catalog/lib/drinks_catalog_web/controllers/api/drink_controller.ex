defmodule DrinksCatalogWeb.Api.DrinkController do
  use DrinksCatalogWeb, :controller

  alias DrinksCatalog.Catalog
  alias DrinksCatalog.Catalog.Drink

  action_fallback DrinksCatalogWeb.FallbackController

  def index(conn, _params) do
    drinks = Catalog.list_drinks()
    render(conn, "index.json", drinks: drinks)
  end

  def create(conn, %{"drink" => drink_params}) do
    with {:ok, %Drink{} = drink} <- Catalog.create_drink(drink_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_drink_path(conn, :show, drink))
      |> render("show.json", drink: drink)
    end
  end

  def show(conn, %{"id" => id}) do
    drink = Catalog.get_drink!(id)
    render(conn, "show.json", drink: drink)
  end

  def update(conn, %{"id" => id, "drink" => drink_params}) do
    drink = Catalog.get_drink!(id)

    with {:ok, %Drink{} = drink} <- Catalog.update_drink(drink, drink_params) do
      render(conn, "show.json", drink: drink)
    end
  end

  def delete(conn, %{"id" => id}) do
    drink = Catalog.get_drink!(id)

    with {:ok, %Drink{}} <- Catalog.delete_drink(drink) do
      send_resp(conn, :no_content, "")
    end
  end
end

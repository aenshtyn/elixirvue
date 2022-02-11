defmodule DrinksCatalogWeb.DrinkController do
  use DrinksCatalogWeb, :controller

  alias DrinksCatalog.Catalog
  alias DrinksCatalog.Catalog.Drink

  def index(conn, _params) do
    drinks = Catalog.list_drinks()
    render(conn, "index.html", drinks: drinks)
  end

  def new(conn, _params) do
    changeset = Catalog.change_drink(%Drink{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"drink" => drink_params}) do
    case Catalog.create_drink(drink_params) do
      {:ok, drink} ->
        conn
        |> put_flash(:info, "Drink created successfully.")
        |> redirect(to: Routes.drink_path(conn, :show, drink))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    drink = Catalog.get_drink!(id)
    render(conn, "show.html", drink: drink)
  end

  def edit(conn, %{"id" => id}) do
    drink = Catalog.get_drink!(id)
    changeset = Catalog.change_drink(drink)
    render(conn, "edit.html", drink: drink, changeset: changeset)
  end

  def update(conn, %{"id" => id, "drink" => drink_params}) do
    drink = Catalog.get_drink!(id)

    case Catalog.update_drink(drink, drink_params) do
      {:ok, drink} ->
        conn
        |> put_flash(:info, "Drink updated successfully.")
        |> redirect(to: Routes.drink_path(conn, :show, drink))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", drink: drink, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    drink = Catalog.get_drink!(id)
    {:ok, _drink} = Catalog.delete_drink(drink)

    conn
    |> put_flash(:info, "Drink deleted successfully.")
    |> redirect(to: Routes.drink_path(conn, :index))
  end
end

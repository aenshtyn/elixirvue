defmodule DrinksCatalogWeb.Api.DrinkView do
  use DrinksCatalogWeb, :view
  alias DrinksCatalogWeb.Api.DrinkView

  def render("index.json", %{drinks: drinks}) do
    %{data: render_many(drinks, DrinkView, "drink.json")}
  end

  def render("show.json", %{drink: drink}) do
    %{data: render_one(drink, DrinkView, "drink.json")}
  end

  def render("drink.json", %{drink: drink}) do
    %{
      id: drink.id,
      name: drink.name,
      brand: drink.brand,
      volume: drink.volume,
      quantity: drink.quantity
    }
  end
end

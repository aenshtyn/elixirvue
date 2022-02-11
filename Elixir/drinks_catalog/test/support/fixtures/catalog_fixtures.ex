defmodule DrinksCatalog.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DrinksCatalog.Catalog` context.
  """

  @doc """
  Generate a drink.
  """
  def drink_fixture(attrs \\ %{}) do
    {:ok, drink} =
      attrs
      |> Enum.into(%{
        brand: "some brand",
        name: "some name",
        quantity: 42,
        volume: 42
      })
      |> DrinksCatalog.Catalog.create_drink()

    drink
  end
end

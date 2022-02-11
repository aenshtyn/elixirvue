defmodule DrinksCatalog.CatalogTest do
  use DrinksCatalog.DataCase

  alias DrinksCatalog.Catalog

  describe "drinks" do
    alias DrinksCatalog.Catalog.Drink

    import DrinksCatalog.CatalogFixtures

    @invalid_attrs %{brand: nil, name: nil, quantity: nil, volume: nil}

    test "list_drinks/0 returns all drinks" do
      drink = drink_fixture()
      assert Catalog.list_drinks() == [drink]
    end

    test "get_drink!/1 returns the drink with given id" do
      drink = drink_fixture()
      assert Catalog.get_drink!(drink.id) == drink
    end

    test "create_drink/1 with valid data creates a drink" do
      valid_attrs = %{brand: "some brand", name: "some name", quantity: 42, volume: 42}

      assert {:ok, %Drink{} = drink} = Catalog.create_drink(valid_attrs)
      assert drink.brand == "some brand"
      assert drink.name == "some name"
      assert drink.quantity == 42
      assert drink.volume == 42
    end

    test "create_drink/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_drink(@invalid_attrs)
    end

    test "update_drink/2 with valid data updates the drink" do
      drink = drink_fixture()
      update_attrs = %{brand: "some updated brand", name: "some updated name", quantity: 43, volume: 43}

      assert {:ok, %Drink{} = drink} = Catalog.update_drink(drink, update_attrs)
      assert drink.brand == "some updated brand"
      assert drink.name == "some updated name"
      assert drink.quantity == 43
      assert drink.volume == 43
    end

    test "update_drink/2 with invalid data returns error changeset" do
      drink = drink_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_drink(drink, @invalid_attrs)
      assert drink == Catalog.get_drink!(drink.id)
    end

    test "delete_drink/1 deletes the drink" do
      drink = drink_fixture()
      assert {:ok, %Drink{}} = Catalog.delete_drink(drink)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_drink!(drink.id) end
    end

    test "change_drink/1 returns a drink changeset" do
      drink = drink_fixture()
      assert %Ecto.Changeset{} = Catalog.change_drink(drink)
    end
  end
end

defmodule DrinksCatalogWeb.Api.DrinkControllerTest do
  use DrinksCatalogWeb.ConnCase

  import DrinksCatalog.CatalogFixtures

  alias DrinksCatalog.Catalog.Drink

  @create_attrs %{
    brand: "some brand",
    name: "some name",
    quantity: 42,
    volume: 42
  }
  @update_attrs %{
    brand: "some updated brand",
    name: "some updated name",
    quantity: 43,
    volume: 43
  }
  @invalid_attrs %{brand: nil, name: nil, quantity: nil, volume: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all drinks", %{conn: conn} do
      conn = get(conn, Routes.api_drink_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create drink" do
    test "renders drink when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_drink_path(conn, :create), drink: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_drink_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "brand" => "some brand",
               "name" => "some name",
               "quantity" => 42,
               "volume" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_drink_path(conn, :create), drink: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update drink" do
    setup [:create_drink]

    test "renders drink when data is valid", %{conn: conn, drink: %Drink{id: id} = drink} do
      conn = put(conn, Routes.api_drink_path(conn, :update, drink), drink: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_drink_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "brand" => "some updated brand",
               "name" => "some updated name",
               "quantity" => 43,
               "volume" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, drink: drink} do
      conn = put(conn, Routes.api_drink_path(conn, :update, drink), drink: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete drink" do
    setup [:create_drink]

    test "deletes chosen drink", %{conn: conn, drink: drink} do
      conn = delete(conn, Routes.api_drink_path(conn, :delete, drink))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_drink_path(conn, :show, drink))
      end
    end
  end

  defp create_drink(_) do
    drink = drink_fixture()
    %{drink: drink}
  end
end

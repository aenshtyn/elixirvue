defmodule DrinksCatalog.Catalog.Drink do
  use Ecto.Schema
  import Ecto.Changeset

  schema "drinks" do
    field :brand, :string
    field :name, :string
    field :quantity, :integer
    field :volume, :integer

    timestamps()
  end

  @doc false
  def changeset(drink, attrs) do
    drink
    |> cast(attrs, [:name, :brand, :volume, :quantity])
    |> validate_required([:name, :brand, :volume, :quantity])
  end
end

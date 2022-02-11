defmodule DrinksCatalog.Repo.Migrations.CreateDrinks do
  use Ecto.Migration

  def change do
    create table(:drinks) do
      add :name, :string
      add :brand, :string
      add :volume, :integer
      add :quantity, :integer

      timestamps()
    end
  end
end

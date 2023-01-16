defmodule Yindlo.Repo.Migrations.CreateHouses do
  use Ecto.Migration

  def change do
    create table(:houses) do
      add :name, :string
      add :capacity, :integer

      timestamps()
    end
  end
end

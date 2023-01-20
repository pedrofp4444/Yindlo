defmodule Yindlo.Repo.Migrations.CreateFurnitures do
  use Ecto.Migration

  def change do
    create table(:furnitures) do
      add :name, :string
      add :state, :string
      add :room_id, references(:rooms)

      timestamps()
    end
  end
end

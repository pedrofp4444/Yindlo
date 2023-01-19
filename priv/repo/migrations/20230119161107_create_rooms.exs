defmodule Yindlo.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :name, :string
      add :furniture_count, :integer

      timestamps()
    end
  end
end

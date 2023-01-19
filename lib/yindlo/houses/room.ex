defmodule Yindlo.Houses.Room do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rooms" do
    field :furniture_count, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:name, :furniture_count])
    |> validate_required([:name, :furniture_count])
  end
end

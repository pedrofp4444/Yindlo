defmodule Yindlo.Houses.House do
  use Ecto.Schema
  import Ecto.Changeset

  schema "houses" do
    field :capacity, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(house, attrs) do
    house
    |> cast(attrs, [:name, :capacity])
    |> validate_required([:name, :capacity])
  end
end

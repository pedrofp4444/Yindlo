defmodule Yindlo.Houses.Furniture do
  use Ecto.Schema
  import Ecto.Changeset
  alias Yindlo.Houses

  schema "furnitures" do
    field :name, :string
    field :state, :string

    belongs_to :room, Houses.Room

    timestamps()
  end

  @doc false
  def changeset(furniture, attrs) do
    furniture
    |> cast(attrs, [:name, :state])
    |> validate_required([:name, :state])
  end
end

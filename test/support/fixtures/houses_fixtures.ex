defmodule Yindlo.HousesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Yindlo.Houses` context.
  """

  @doc """
  Generate a house.
  """
  def house_fixture(attrs \\ %{}) do
    {:ok, house} =
      attrs
      |> Enum.into(%{
        capacity: 42,
        name: "some name"
      })
      |> Yindlo.Houses.create_house()

    house
  end
end

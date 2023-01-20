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

  @doc """
  Generate a room.
  """
  def room_fixture(attrs \\ %{}) do
    {:ok, room} =
      attrs
      |> Enum.into(%{
        furniture_count: 42,
        name: "some name"
      })
      |> Yindlo.Houses.create_room()

    room
  end

  @doc """
  Generate a furniture.
  """
  def furniture_fixture(attrs \\ %{}) do
    {:ok, furniture} =
      attrs
      |> Enum.into(%{
        name: "some name",
        state: "some state"
      })
      |> Yindlo.Houses.create_furniture()

    furniture
  end
end

defmodule Yindlo.HousesTest do
  use Yindlo.DataCase

  alias Yindlo.Houses

  describe "houses" do
    alias Yindlo.Houses.House

    import Yindlo.HousesFixtures

    @invalid_attrs %{capacity: nil, name: nil}

    test "list_houses/0 returns all houses" do
      house = house_fixture()
      assert Houses.list_houses() == [house]
    end

    test "get_house!/1 returns the house with given id" do
      house = house_fixture()
      assert Houses.get_house!(house.id) == house
    end

    test "create_house/1 with valid data creates a house" do
      valid_attrs = %{capacity: 42, name: "some name"}

      assert {:ok, %House{} = house} = Houses.create_house(valid_attrs)
      assert house.capacity == 42
      assert house.name == "some name"
    end

    test "create_house/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Houses.create_house(@invalid_attrs)
    end

    test "update_house/2 with valid data updates the house" do
      house = house_fixture()
      update_attrs = %{capacity: 43, name: "some updated name"}

      assert {:ok, %House{} = house} = Houses.update_house(house, update_attrs)
      assert house.capacity == 43
      assert house.name == "some updated name"
    end

    test "update_house/2 with invalid data returns error changeset" do
      house = house_fixture()
      assert {:error, %Ecto.Changeset{}} = Houses.update_house(house, @invalid_attrs)
      assert house == Houses.get_house!(house.id)
    end

    test "delete_house/1 deletes the house" do
      house = house_fixture()
      assert {:ok, %House{}} = Houses.delete_house(house)
      assert_raise Ecto.NoResultsError, fn -> Houses.get_house!(house.id) end
    end

    test "change_house/1 returns a house changeset" do
      house = house_fixture()
      assert %Ecto.Changeset{} = Houses.change_house(house)
    end
  end

  describe "rooms" do
    alias Yindlo.Houses.Room

    import Yindlo.HousesFixtures

    @invalid_attrs %{furniture_count: nil, name: nil}

    test "list_rooms/0 returns all rooms" do
      room = room_fixture()
      assert Houses.list_rooms() == [room]
    end

    test "get_room!/1 returns the room with given id" do
      room = room_fixture()
      assert Houses.get_room!(room.id) == room
    end

    test "create_room/1 with valid data creates a room" do
      valid_attrs = %{furniture_count: 42, name: "some name"}

      assert {:ok, %Room{} = room} = Houses.create_room(valid_attrs)
      assert room.furniture_count == 42
      assert room.name == "some name"
    end

    test "create_room/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Houses.create_room(@invalid_attrs)
    end

    test "update_room/2 with valid data updates the room" do
      room = room_fixture()
      update_attrs = %{furniture_count: 43, name: "some updated name"}

      assert {:ok, %Room{} = room} = Houses.update_room(room, update_attrs)
      assert room.furniture_count == 43
      assert room.name == "some updated name"
    end

    test "update_room/2 with invalid data returns error changeset" do
      room = room_fixture()
      assert {:error, %Ecto.Changeset{}} = Houses.update_room(room, @invalid_attrs)
      assert room == Houses.get_room!(room.id)
    end

    test "delete_room/1 deletes the room" do
      room = room_fixture()
      assert {:ok, %Room{}} = Houses.delete_room(room)
      assert_raise Ecto.NoResultsError, fn -> Houses.get_room!(room.id) end
    end

    test "change_room/1 returns a room changeset" do
      room = room_fixture()
      assert %Ecto.Changeset{} = Houses.change_room(room)
    end
  end

  describe "furnitures" do
    alias Yindlo.Houses.Furniture

    import Yindlo.HousesFixtures

    @invalid_attrs %{name: nil, state: nil}

    test "list_furnitures/0 returns all furnitures" do
      furniture = furniture_fixture()
      assert Houses.list_furnitures() == [furniture]
    end

    test "get_furniture!/1 returns the furniture with given id" do
      furniture = furniture_fixture()
      assert Houses.get_furniture!(furniture.id) == furniture
    end

    test "create_furniture/1 with valid data creates a furniture" do
      valid_attrs = %{name: "some name", state: "some state"}

      assert {:ok, %Furniture{} = furniture} = Houses.create_furniture(valid_attrs)
      assert furniture.name == "some name"
      assert furniture.state == "some state"
    end

    test "create_furniture/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Houses.create_furniture(@invalid_attrs)
    end

    test "update_furniture/2 with valid data updates the furniture" do
      furniture = furniture_fixture()
      update_attrs = %{name: "some updated name", state: "some updated state"}

      assert {:ok, %Furniture{} = furniture} = Houses.update_furniture(furniture, update_attrs)
      assert furniture.name == "some updated name"
      assert furniture.state == "some updated state"
    end

    test "update_furniture/2 with invalid data returns error changeset" do
      furniture = furniture_fixture()
      assert {:error, %Ecto.Changeset{}} = Houses.update_furniture(furniture, @invalid_attrs)
      assert furniture == Houses.get_furniture!(furniture.id)
    end

    test "delete_furniture/1 deletes the furniture" do
      furniture = furniture_fixture()
      assert {:ok, %Furniture{}} = Houses.delete_furniture(furniture)
      assert_raise Ecto.NoResultsError, fn -> Houses.get_furniture!(furniture.id) end
    end

    test "change_furniture/1 returns a furniture changeset" do
      furniture = furniture_fixture()
      assert %Ecto.Changeset{} = Houses.change_furniture(furniture)
    end
  end
end

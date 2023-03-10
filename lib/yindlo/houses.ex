defmodule Yindlo.Houses do
  @moduledoc """
  The Houses context.
  """

  import Ecto.Query, warn: false
  alias Yindlo.Repo

  alias Yindlo.Houses.House

  @doc """
  Returns the list of houses.

  ## Examples

      iex> list_houses()
      [%House{}, ...]

  """
  def list_houses do
    Repo.all(House)
  end

  @doc """
  Gets a single house.

  Raises `Ecto.NoResultsError` if the House does not exist.

  ## Examples

      iex> get_house!(123)
      %House{}

      iex> get_house!(456)
      ** (Ecto.NoResultsError)

  """
  def get_house!(id), do: Repo.get!(House, id)

  @doc """
  Creates a house.

  ## Examples

      iex> create_house(%{field: value})
      {:ok, %House{}}

      iex> create_house(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_house(attrs \\ %{}) do
    %House{}
    |> House.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a house.

  ## Examples

      iex> update_house(house, %{field: new_value})
      {:ok, %House{}}

      iex> update_house(house, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_house(%House{} = house, attrs) do
    house
    |> House.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a house.

  ## Examples

      iex> delete_house(house)
      {:ok, %House{}}

      iex> delete_house(house)
      {:error, %Ecto.Changeset{}}

  """
  def delete_house(%House{} = house) do
    Repo.delete(house)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking house changes.

  ## Examples

      iex> change_house(house)
      %Ecto.Changeset{data: %House{}}

  """
  def change_house(%House{} = house, attrs \\ %{}) do
    House.changeset(house, attrs)
  end

  alias Yindlo.Houses.Room

  @doc """
  Returns the list of rooms.

  ## Examples

      iex> list_rooms()
      [%Room{}, ...]

  """
  def list_rooms do
    Repo.all(Room)
  end

  @doc """
  Gets a single room.

  Raises `Ecto.NoResultsError` if the Room does not exist.

  ## Examples

      iex> get_room!(123)
      %Room{}

      iex> get_room!(456)
      ** (Ecto.NoResultsError)

  """
  def get_room!(id), do: Repo.get!(Room, id)

  @doc """
  Creates a room.

  ## Examples

      iex> create_room(%{field: value})
      {:ok, %Room{}}

      iex> create_room(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_room(attrs \\ %{}) do
    %Room{}
    |> Room.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a room.

  ## Examples

      iex> update_room(room, %{field: new_value})
      {:ok, %Room{}}

      iex> update_room(room, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_room(%Room{} = room, attrs) do
    room
    |> Room.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a room.

  ## Examples

      iex> delete_room(room)
      {:ok, %Room{}}

      iex> delete_room(room)
      {:error, %Ecto.Changeset{}}

  """
  def delete_room(%Room{} = room) do
    Repo.delete(room)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking room changes.

  ## Examples

      iex> change_room(room)
      %Ecto.Changeset{data: %Room{}}

  """
  def change_room(%Room{} = room, attrs \\ %{}) do
    Room.changeset(room, attrs)
  end

  alias Yindlo.Houses.Furniture

  @doc """
  Returns the list of furnitures.

  ## Examples

      iex> list_furnitures()
      [%Furniture{}, ...]

  """
  def list_furnitures do
    Repo.all(Furniture)
  end

  @doc """
  Gets a single furniture.

  Raises `Ecto.NoResultsError` if the Furniture does not exist.

  ## Examples

      iex> get_furniture!(123)
      %Furniture{}

      iex> get_furniture!(456)
      ** (Ecto.NoResultsError)

  """
  def get_furniture!(id), do: Repo.get!(Furniture, id)

  @doc """
  Creates a furniture.

  ## Examples

      iex> create_furniture(%{field: value})
      {:ok, %Furniture{}}

      iex> create_furniture(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_furniture(attrs \\ %{}) do
    %Furniture{}
    |> Furniture.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a furniture.

  ## Examples

      iex> update_furniture(furniture, %{field: new_value})
      {:ok, %Furniture{}}

      iex> update_furniture(furniture, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_furniture(%Furniture{} = furniture, attrs) do
    furniture
    |> Furniture.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a furniture.

  ## Examples

      iex> delete_furniture(furniture)
      {:ok, %Furniture{}}

      iex> delete_furniture(furniture)
      {:error, %Ecto.Changeset{}}

  """
  def delete_furniture(%Furniture{} = furniture) do
    Repo.delete(furniture)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking furniture changes.

  ## Examples

      iex> change_furniture(furniture)
      %Ecto.Changeset{data: %Furniture{}}

  """
  def change_furniture(%Furniture{} = furniture, attrs \\ %{}) do
    Furniture.changeset(furniture, attrs)
  end
end

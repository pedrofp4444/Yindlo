defmodule YindloWeb.RoomLive.FormComponent do
  use YindloWeb, :live_component

  alias Yindlo.Houses

  @impl true
  def update(%{room: room} = assigns, socket) do
    changeset = Houses.change_room(room)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"room" => room_params}, socket) do
    changeset =
      socket.assigns.room
      |> Houses.change_room(room_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"room" => room_params}, socket) do
    save_room(socket, socket.assigns.action, room_params)
  end

  defp save_room(socket, :edit, room_params) do
    case Houses.update_room(socket.assigns.room, room_params) do
      {:ok, _room} ->
        {:noreply,
         socket
         |> put_flash(:info, "Room updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_room(socket, :new, room_params) do
    case Houses.create_room(room_params) do
      {:ok, _room} ->
        {:noreply,
         socket
         |> put_flash(:info, "Room created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end

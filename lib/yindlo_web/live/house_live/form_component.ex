defmodule YindloWeb.HouseLive.FormComponent do
  use YindloWeb, :live_component

  alias Yindlo.Houses

  @impl true
  def update(%{house: house} = assigns, socket) do
    changeset = Houses.change_house(house)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"house" => house_params}, socket) do
    changeset =
      socket.assigns.house
      |> Houses.change_house(house_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"house" => house_params}, socket) do
    save_house(socket, socket.assigns.action, house_params)
  end

  defp save_house(socket, :edit, house_params) do
    case Houses.update_house(socket.assigns.house, house_params) do
      {:ok, _house} ->
        {:noreply,
         socket
         |> put_flash(:info, "House updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_house(socket, :new, house_params) do
    case Houses.create_house(house_params) do
      {:ok, _house} ->
        {:noreply,
         socket
         |> put_flash(:info, "House created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end

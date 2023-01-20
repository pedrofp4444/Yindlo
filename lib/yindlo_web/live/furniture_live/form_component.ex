defmodule YindloWeb.FurnitureLive.FormComponent do
  use YindloWeb, :live_component

  alias Yindlo.Houses

  @impl true
  def update(%{furniture: furniture} = assigns, socket) do
    changeset = Houses.change_furniture(furniture)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"furniture" => furniture_params}, socket) do
    changeset =
      socket.assigns.furniture
      |> Houses.change_furniture(furniture_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"furniture" => furniture_params}, socket) do
    save_furniture(socket, socket.assigns.action, furniture_params)
  end

  defp save_furniture(socket, :edit, furniture_params) do
    case Houses.update_furniture(socket.assigns.furniture, furniture_params) do
      {:ok, _furniture} ->
        {:noreply,
         socket
         |> put_flash(:info, "Furniture updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_furniture(socket, :new, furniture_params) do
    case Houses.create_furniture(furniture_params) do
      {:ok, _furniture} ->
        {:noreply,
         socket
         |> put_flash(:info, "Furniture created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end

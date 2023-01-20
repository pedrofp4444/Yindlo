defmodule YindloWeb.FurnitureLive.Index do
  use YindloWeb, :live_view

  alias Yindlo.Houses
  alias Yindlo.Houses.Furniture

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :furnitures, list_furnitures())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Furniture")
    |> assign(:furniture, Houses.get_furniture!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Furniture")
    |> assign(:furniture, %Furniture{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Furnitures")
    |> assign(:furniture, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    furniture = Houses.get_furniture!(id)
    {:ok, _} = Houses.delete_furniture(furniture)

    {:noreply, assign(socket, :furnitures, list_furnitures())}
  end

  defp list_furnitures do
    Houses.list_furnitures()
  end
end

defmodule YindloWeb.FurnitureLive.Show do
  use YindloWeb, :live_view

  alias Yindlo.Houses

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:furniture, Houses.get_furniture!(id))}
  end

  defp page_title(:show), do: "Show Furniture"
  defp page_title(:edit), do: "Edit Furniture"
end

defmodule YindloWeb.PageController do
  use YindloWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

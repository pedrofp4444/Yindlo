defmodule YindloWeb.FurnitureLiveTest do
  use YindloWeb.ConnCase

  import Phoenix.LiveViewTest
  import Yindlo.HousesFixtures

  @create_attrs %{name: "some name", state: "some state"}
  @update_attrs %{name: "some updated name", state: "some updated state"}
  @invalid_attrs %{name: nil, state: nil}

  defp create_furniture(_) do
    furniture = furniture_fixture()
    %{furniture: furniture}
  end

  describe "Index" do
    setup [:create_furniture]

    test "lists all furnitures", %{conn: conn, furniture: furniture} do
      {:ok, _index_live, html} = live(conn, Routes.furniture_index_path(conn, :index))

      assert html =~ "Listing Furnitures"
      assert html =~ furniture.name
    end

    test "saves new furniture", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.furniture_index_path(conn, :index))

      assert index_live |> element("a", "New Furniture") |> render_click() =~
               "New Furniture"

      assert_patch(index_live, Routes.furniture_index_path(conn, :new))

      assert index_live
             |> form("#furniture-form", furniture: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#furniture-form", furniture: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.furniture_index_path(conn, :index))

      assert html =~ "Furniture created successfully"
      assert html =~ "some name"
    end

    test "updates furniture in listing", %{conn: conn, furniture: furniture} do
      {:ok, index_live, _html} = live(conn, Routes.furniture_index_path(conn, :index))

      assert index_live |> element("#furniture-#{furniture.id} a", "Edit") |> render_click() =~
               "Edit Furniture"

      assert_patch(index_live, Routes.furniture_index_path(conn, :edit, furniture))

      assert index_live
             |> form("#furniture-form", furniture: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#furniture-form", furniture: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.furniture_index_path(conn, :index))

      assert html =~ "Furniture updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes furniture in listing", %{conn: conn, furniture: furniture} do
      {:ok, index_live, _html} = live(conn, Routes.furniture_index_path(conn, :index))

      assert index_live |> element("#furniture-#{furniture.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#furniture-#{furniture.id}")
    end
  end

  describe "Show" do
    setup [:create_furniture]

    test "displays furniture", %{conn: conn, furniture: furniture} do
      {:ok, _show_live, html} = live(conn, Routes.furniture_show_path(conn, :show, furniture))

      assert html =~ "Show Furniture"
      assert html =~ furniture.name
    end

    test "updates furniture within modal", %{conn: conn, furniture: furniture} do
      {:ok, show_live, _html} = live(conn, Routes.furniture_show_path(conn, :show, furniture))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Furniture"

      assert_patch(show_live, Routes.furniture_show_path(conn, :edit, furniture))

      assert show_live
             |> form("#furniture-form", furniture: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#furniture-form", furniture: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.furniture_show_path(conn, :show, furniture))

      assert html =~ "Furniture updated successfully"
      assert html =~ "some updated name"
    end
  end
end

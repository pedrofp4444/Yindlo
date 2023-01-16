defmodule YindloWeb.HouseLiveTest do
  use YindloWeb.ConnCase

  import Phoenix.LiveViewTest
  import Yindlo.HousesFixtures

  @create_attrs %{capacity: 42, name: "some name"}
  @update_attrs %{capacity: 43, name: "some updated name"}
  @invalid_attrs %{capacity: nil, name: nil}

  defp create_house(_) do
    house = house_fixture()
    %{house: house}
  end

  describe "Index" do
    setup [:create_house]

    test "lists all houses", %{conn: conn, house: house} do
      {:ok, _index_live, html} = live(conn, Routes.house_index_path(conn, :index))

      assert html =~ "Listing Houses"
      assert html =~ house.name
    end

    test "saves new house", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.house_index_path(conn, :index))

      assert index_live |> element("a", "New House") |> render_click() =~
               "New House"

      assert_patch(index_live, Routes.house_index_path(conn, :new))

      assert index_live
             |> form("#house-form", house: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#house-form", house: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.house_index_path(conn, :index))

      assert html =~ "House created successfully"
      assert html =~ "some name"
    end

    test "updates house in listing", %{conn: conn, house: house} do
      {:ok, index_live, _html} = live(conn, Routes.house_index_path(conn, :index))

      assert index_live |> element("#house-#{house.id} a", "Edit") |> render_click() =~
               "Edit House"

      assert_patch(index_live, Routes.house_index_path(conn, :edit, house))

      assert index_live
             |> form("#house-form", house: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#house-form", house: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.house_index_path(conn, :index))

      assert html =~ "House updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes house in listing", %{conn: conn, house: house} do
      {:ok, index_live, _html} = live(conn, Routes.house_index_path(conn, :index))

      assert index_live |> element("#house-#{house.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#house-#{house.id}")
    end
  end

  describe "Show" do
    setup [:create_house]

    test "displays house", %{conn: conn, house: house} do
      {:ok, _show_live, html} = live(conn, Routes.house_show_path(conn, :show, house))

      assert html =~ "Show House"
      assert html =~ house.name
    end

    test "updates house within modal", %{conn: conn, house: house} do
      {:ok, show_live, _html} = live(conn, Routes.house_show_path(conn, :show, house))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit House"

      assert_patch(show_live, Routes.house_show_path(conn, :edit, house))

      assert show_live
             |> form("#house-form", house: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#house-form", house: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.house_show_path(conn, :show, house))

      assert html =~ "House updated successfully"
      assert html =~ "some updated name"
    end
  end
end

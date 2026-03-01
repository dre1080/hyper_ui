defmodule HyperUI.Components.ApplicationUITest do
  use ExUnit.Case, async: true
  import Phoenix.LiveViewTest
  import Phoenix.Component
  import HyperUI.Components.ApplicationUI

  test "renders badge" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.badge color="purple" size="md">Test Badge</.badge>
      """)

    assert html =~ "bg-purple-100"
    assert html =~ "Test Badge"
  end

  test "renders button" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.button color="indigo">Click Me</.button>
      """)

    assert html =~ "bg-indigo-600"
    assert html =~ "Click Me"
  end

  test "renders alert" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.alert kind="success" title="Success!">Operation complete</.alert>
      """)

    assert html =~ "text-green-600"
    assert html =~ "Success!"
    assert html =~ "Operation complete"
  end

  test "renders table" do
    assigns = %{rows: [%{id: 1, name: "John"}, %{id: 2, name: "Jane"}]}

    html =
      rendered_to_string(~H"""
      <.table rows={@rows}>
        <:col :let={row} label="ID"><%= row.id %></:col>
        <:col :let={row} label="Name"><%= row.name %></:col>
      </.table>
      """)

    assert html =~ "John"
    assert html =~ "Jane"
    assert html =~ "ID"
    assert html =~ "Name"
  end

  test "renders tabs" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.tabs>
        <:tab title="Tab 1" active={true} />
        <:tab title="Tab 2" />
      </.tabs>
      """)

    assert html =~ "Tab 1"
    assert html =~ "Tab 2"
    assert html =~ "aria-current=\"page\""
  end

  test "renders filters" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.filters>
        <:section title="Category">
          <label><input type="checkbox" /> Electronics</label>
        </:section>
      </.filters>
      """)

    assert html =~ "Category"
    assert html =~ "Electronics"
    assert html =~ "Reset"
  end

  test "renders vertical_menu" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.vertical_menu>
        <:item title="Dashboard" active={true} />
        <:item title="Settings" />
      </.vertical_menu>
      """)

    assert html =~ "Dashboard"
    assert html =~ "Settings"
    assert html =~ "bg-gray-100"
  end

  test "renders divider" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.divider>OR</.divider>
      """)

    assert html =~ "OR"
    assert html =~ "flex-1 bg-gray-200"
  end

  test "renders empty_state" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.empty_state title="No products found" subtitle="Try another search">
        <button>Clear filters</button>
      </.empty_state>
      """)

    assert html =~ "No products found"
    assert html =~ "Try another search"
    assert html =~ "Clear filters"
  end

  test "renders steps" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.steps>
        <:step title="Details" active={true} />
        <:step title="Address" />
        <:step title="Payment" />
      </.steps>
      """)

    assert html =~ "Details"
    assert html =~ "Address"
    assert html =~ "Payment"
    assert html =~ "text-blue-600"
  end

  test "renders dropdown" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.dropdown id="test_dropdown">
        <:toggle>Options</:toggle>
        <:item url="/edit">Edit</:item>
        <:item>Delete</:item>
      </.dropdown>
      """)

    assert html =~ "Options"
    assert html =~ "Edit"
    assert html =~ "Delete"
    assert html =~ "test_dropdown-menu"
  end

  test "renders button_group" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.button_group>
        <.button>Left</.button>
        <.button>Middle</.button>
        <.button>Right</.button>
      </.button_group>
      """)

    assert html =~ "Left"
    assert html =~ "Middle"
    assert html =~ "Right"
  end

  test "renders breadcrumbs" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.breadcrumbs>
        <:item url="/">Home</:item>
        <:item url="/shop">Shop</:item>
        <:item>T-Shirt</:item>
      </.breadcrumbs>
      """)

    assert html =~ "Home"
    assert html =~ "Shop"
    assert html =~ "T-Shirt"
  end

  test "renders pagination" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.pagination current_page={2} total_pages={5} />
      """)

    assert html =~ "Prev Page"
    assert html =~ "Next Page"
    assert html =~ "2"
    assert html =~ "bg-black"
    assert html =~ "text-white"
  end

  test "renders modal" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.modal id="test_modal" show={true}>
        <:title>Modal Title</:title>
        This is modal content.
        <:footer>
          <button>Close</button>
        </:footer>
      </.modal>
      """)

    assert html =~ "Modal Title"
    assert html =~ "This is modal content."
    assert html =~ "Close"
    assert html =~ "test_modal"
  end
end

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
    assigns = %{}
    rows = [%{id: 1, name: "John"}, %{id: 2, name: "Jane"}]

    html =
      rendered_to_string(~H"""
      <.table rows={rows}>
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
    assert html =~ "bg-sky-100"
  end

  test "renders filters" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.filters>
        <:section title="Category">
          Filter Content
        </:section>
      </.filters>
      """)

    assert html =~ "Category"
    assert html =~ "Filter Content"
  end
end

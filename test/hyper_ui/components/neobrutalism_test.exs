defmodule HyperUI.Components.NeobrutalismTest do
  use ExUnit.Case, async: true
  import Phoenix.LiveViewTest
  import Phoenix.Component
  import HyperUI.Components.Neobrutalism

  test "renders button" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.button>Neobrutalism</.button>
      """)

    assert html =~ "border-2 border-black"
    assert html =~ "Neobrutalism"
  end

  test "renders badge" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.badge>NeoBadge</.badge>
      """)

    assert html =~ "border-2 border-black"
    assert html =~ "NeoBadge"
  end

  test "renders input" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.input id="neo_input" name="neo" />
      """)

    assert html =~ "border-2 border-black"
    assert html =~ "name=\"neo\""
  end
end

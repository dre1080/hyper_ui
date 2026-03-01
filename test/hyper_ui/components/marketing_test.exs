defmodule HyperUI.Components.MarketingTest do
  use ExUnit.Case, async: true
  import Phoenix.LiveViewTest
  import Phoenix.Component
  import HyperUI.Components.Marketing

  test "renders faq" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.faq title="Common Question">
        <:item question="How do I use this?">
          Just import the module.
        </:item>
      </.faq>
      """)

    assert html =~ "Common Question"
    assert html =~ "How do I use this?"
    assert html =~ "Just import the module."
  end

  test "renders hero" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.hero title="Main Header" subtitle="Subtitle here" />
      """)

    assert html =~ "Main Header"
    assert html =~ "Subtitle here"
  end

  test "renders pricing" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.pricing>
        <:plan name="Free Plan" price="$0" description="For beginners">
          <li>Basic support</li>
        </:plan>
      </.pricing>
      """)

    assert html =~ "Free Plan"
    assert html =~ "$0"
    assert html =~ "For beginners"
    assert html =~ "Basic support"
  end
end

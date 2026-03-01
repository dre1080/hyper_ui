defmodule HyperUI.Components.ApplicationUI.FormsTest do
  use ExUnit.Case, async: true
  import Phoenix.LiveViewTest
  import Phoenix.Component
  import HyperUI.Components.ApplicationUI.Forms

  test "renders input" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.input id="email" name="user[email]" label="Email" />
      """)

    assert html =~ "Email"
    assert html =~ "name=\"user[email]\""
    assert html =~ "type=\"text\""
  end

  test "renders toggle" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.toggle id="marketing" name="marketing" checked={true} />
      """)

    assert html =~ "type=\"checkbox\""
    assert html =~ "checked"
  end
end

defmodule HyperUI.Components.NeobrutalismTest do
  use ExUnit.Case, async: true
  import Phoenix.LiveViewTest
  import Phoenix.Component
  import HyperUI.Components.Neobrutalism

  test "renders button" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.neo_button>Neobrutalism</.neo_button>
      """)

    assert html =~ "border-2 border-black"
    assert html =~ "Neobrutalism"
  end

  test "renders badge" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.neo_badge>NeoBadge</.neo_badge>
      """)

    assert html =~ "border-2 border-black"
    assert html =~ "NeoBadge"
  end

  test "renders input" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.neo_input id="neo_input" name="neo" />
      """)

    assert html =~ "border-2 border-black"
    assert html =~ "name=\"neo\""
  end

  test "renders accordion" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.neo_accordion title="Neo FAQ" open={true}>
        Bold content here.
      </.neo_accordion>
      """)

    assert html =~ "Neo FAQ"
    assert html =~ "Bold content here."
    assert html =~ "open"
  end

  test "renders progress" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.neo_progress value={60} max={100} color="emerald" />
      """)

    assert html =~ "progressbar"
    assert html =~ "aria-valuenow=\"60\""
    assert html =~ "width: 60%;"
    assert html =~ "bg-emerald-400"
  end

  test "renders select" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.neo_select id="neo_select" name="neo_select" label="Pick one">
        <option value="1">Option 1</option>
      </.neo_select>
      """)

    assert html =~ "Pick one"
    assert html =~ "Option 1"
    assert html =~ "shadow-[4px_4px_0px_0px_rgba(0,0,0,1)]"
  end

  test "renders textarea" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.neo_textarea id="neo_text" name="neo_text" label="Message" rows={5} />
      """)

    assert html =~ "Message"
    assert html =~ "rows=\"5\""
    assert html =~ "border-2 border-black"
  end

  test "renders tabs" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.neo_tabs>
        <:tab title="Tab A" active={true} color="cyan" />
        <:tab title="Tab B" />
      </.neo_tabs>
      """)

    assert html =~ "Tab A"
    assert html =~ "Tab B"
    assert html =~ "bg-cyan-400"
  end

  test "renders alert" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.neo_alert kind="error" title="Stop!">Dangerous action</.neo_alert>
      """)

    assert html =~ "Stop!"
    assert html =~ "Dangerous action"
    assert html =~ "bg-pink-500"
  end

  test "renders checkbox" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.neo_checkbox id="neo_check" name="neo_check" label="Accept" checked={true} />
      """)

    assert html =~ "Accept"
    assert html =~ "checked"
    assert html =~ "appearance-none"
  end

  test "renders card" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.neo_card title="Brutal Card" category="Design">
        Nice content.
        <:footer>
          <a href="#">Read More</a>
        </:footer>
      </.neo_card>
      """)

    assert html =~ "Brutal Card"
    assert html =~ "Design"
    assert html =~ "Nice content."
    assert html =~ "Read More"
    assert html =~ "bg-pink-400"
  end
end

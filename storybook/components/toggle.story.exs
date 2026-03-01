defmodule HyperUI.Storybook.Toggle do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.ApplicationUI.Forms.toggle/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{id: "toggle-default", name: "toggle", checked: false}
      },
      %Variation{
        id: :checked,
        attributes: %{id: "toggle-checked", name: "toggle", checked: true}
      }
    ]
  end
end

defmodule HyperUI.Storybook.Neobrutalism do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Neobrutalism.neo_button/1

  def variations do
    [
      %VariationGroup{
        id: :buttons,
        variations: [
          %Variation{
            id: :button_yellow,
            attributes: %{color: "yellow"},
            slots: ["Get Started"]
          },
          %Variation{
            id: :button_pink_pressed,
            attributes: %{color: "pink", variant: "pressed"},
            slots: ["Click Me"]
          },
          %Variation{
            id: :button_cyan_underline,
            attributes: %{color: "cyan", variant: "underline"},
            slots: ["Subscribe"]
          }
        ]
      }
    ]
  end
end

defmodule HyperUI.Storybook.NeobrutalismBadge do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Neobrutalism.badge/1

  def variations do
    [
      %Variation{
        id: :yellow,
        attributes: %{color: "yellow"},
        slots: ["NEW"]
      },
      %Variation{
        id: :pink,
        attributes: %{color: "pink"},
        slots: ["SALE"]
      }
    ]
  end
end

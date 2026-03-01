defmodule HyperUI.Storybook.NeobrutalismProgress do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Neobrutalism.progress/1

  def variations do
    [
      %Variation{
        id: :yellow,
        attributes: %{value: 75, color: "yellow"}
      },
      %Variation{
        id: :pink,
        attributes: %{value: 40, color: "pink"}
      }
    ]
  end
end

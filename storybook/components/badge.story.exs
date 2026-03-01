defmodule HyperUI.Storybook.Badge do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.ApplicationUI.badge/1

  def variations do
    [
      %Variation{
        id: :gray,
        attributes: %{color: "gray"},
        slots: ["Live"]
      },
      %Variation{
        id: :purple,
        attributes: %{color: "purple"},
        slots: ["Live"]
      },
      %Variation{
        id: :emerald,
        attributes: %{color: "emerald"},
        slots: ["Published"]
      },
      %Variation{
        id: :amber,
        attributes: %{color: "amber"},
        slots: ["Warning"]
      }
    ]
  end
end

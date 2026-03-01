defmodule HyperUI.Storybook.Button do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.ApplicationUI.button/1

  def variations do
    [
      %Variation{
        id: :solid,
        attributes: %{variant: "solid", color: "black"},
        slots: ["Download"]
      },
      %Variation{
        id: :outline,
        attributes: %{variant: "outline", color: "black"},
        slots: ["Download"]
      },
      %Variation{
        id: :emerald,
        attributes: %{variant: "solid", color: "emerald"},
        slots: ["Get Started"]
      }
    ]
  end
end

defmodule HyperUI.Storybook.NeobrutalismAccordion do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Neobrutalism.neo_accordion/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{title: "How do I use this?"},
        slots: ["Just copy the code and paste it into your Tailwind CSS project."]
      }
    ]
  end
end

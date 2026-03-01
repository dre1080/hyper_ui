defmodule HyperUI.Storybook.NeobrutalismProgress do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Neobrutalism.progress/1

  def variations do
    [
      %Variation{
        id: :yellow,
        attributes: %{value: 75, color: "yellow"},
        template:
          "<div class='w-full max-w-md p-4 bg-gray-50 border-2 border-black'><.psb-variation/></div>"
      },
      %Variation{
        id: :pink,
        attributes: %{value: 40, color: "pink"},
        template:
          "<div class='w-full max-w-md p-4 bg-gray-50 border-2 border-black'><.psb-variation/></div>"
      },
      %Variation{
        id: :full,
        attributes: %{value: 100, color: "emerald"},
        template:
          "<div class='w-full max-w-md p-4 bg-gray-50 border-2 border-black'><.psb-variation/></div>"
      },
      %Variation{
        id: :empty,
        attributes: %{value: 0, color: "cyan"},
        template:
          "<div class='w-full max-w-md p-4 bg-gray-50 border-2 border-black'><.psb-variation/></div>"
      }
    ]
  end
end

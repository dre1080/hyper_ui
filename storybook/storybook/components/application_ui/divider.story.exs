defmodule HyperUI.Storybook.Divider do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.ApplicationUI.divider/1

  def variations do
    [
      %Variation{
        id: :default
      },
      %Variation{
        id: :with_text,
        slots: ["OR"]
      }
    ]
  end
end

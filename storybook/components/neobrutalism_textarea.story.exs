defmodule HyperUI.Storybook.NeobrutalismTextarea do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Neobrutalism.textarea/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          id: "neo-textarea",
          name: "notes",
          label: "Order notes",
          placeholder: "Enter any additional order notes..."
        }
      }
    ]
  end
end

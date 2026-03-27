defmodule HyperUI.Storybook.NeobrutalismInput do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Neobrutalism.neo_input/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          id: "neo-input",
          name: "email",
          label: "Email",
          placeholder: "john@doe.com"
        }
      }
    ]
  end
end

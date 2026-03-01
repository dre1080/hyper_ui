defmodule HyperUI.Storybook.NeobrutalismSelect do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Neobrutalism.select/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{id: "neo-select", name: "headline", label: "Select Option"},
        slots: [
          """
          <option value="">Please select</option>
          <option value="JM">John Mayer</option>
          <option value="SRV">Stevie Ray Vaughan</option>
          """
        ]
      }
    ]
  end
end

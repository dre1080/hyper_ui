defmodule HyperUI.Storybook.Dropdown do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.ApplicationUI.dropdown/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{id: "example-dropdown"},
        slots: [
          """
          <:toggle>Options</:toggle>
          <:item url="#">View Profile</:item>
          <:item url="#">Settings</:item>
          <:item class="text-red-600">Delete Account</:item>
          """
        ]
      }
    ]
  end
end

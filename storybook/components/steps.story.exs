defmodule HyperUI.Storybook.Steps do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.ApplicationUI.steps/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          """
          <:step title="Details" active={true} />
          <:step title="Address" />
          <:step title="Payment" />
          """
        ]
      }
    ]
  end
end

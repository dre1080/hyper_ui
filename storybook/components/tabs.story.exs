defmodule HyperUI.Storybook.Tabs do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.ApplicationUI.tabs/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          """
          <:tab title="General" active={true} />
          <:tab title="Teams" />
          <:tab title="Billing" />
          """
        ]
      }
    ]
  end
end

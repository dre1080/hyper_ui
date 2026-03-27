defmodule HyperUI.Storybook.VerticalMenu do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.ApplicationUI.vertical_menu/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          """
          <:item title="General" active={true} />
          <:item title="Teams" />
          <:item title="Billing" />
          <:item title="Invoices" />
          """
        ]
      }
    ]
  end
end

defmodule HyperUI.Storybook.Breadcrumbs do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.ApplicationUI.breadcrumbs/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          """
          <:item url="/">Home</:item>
          <:item url="/components">Components</:item>
          <:item>Breadcrumbs</:item>
          """
        ]
      }
    ]
  end
end

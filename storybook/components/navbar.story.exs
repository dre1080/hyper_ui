defmodule HyperUI.Storybook.Navbar do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Marketing.navbar/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          """
          <:brand><span class="text-2xl font-bold">HyperUI</span></:brand>
          <:item url="#">About</:item>
          <:item url="#">Services</:item>
          <:item url="#">Contact</:item>
          <:action>
            <HyperUI.Components.ApplicationUI.button color="black" class="px-5 py-2.5">Login</HyperUI.Components.ApplicationUI.button>
          </:action>
          """
        ]
      }
    ]
  end
end

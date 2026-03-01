defmodule HyperUI.Storybook.Cta do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Marketing.cta/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          title: "Lorem, ipsum dolor sit amet consectetur adipisicing elit",
          subtitle:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et, egestas tempus tellus etiam sed."
        },
        slots: [
          """
          <HyperUI.Components.ApplicationUI.button color="black">Get Started Today</HyperUI.Components.ApplicationUI.button>
          """
        ]
      }
    ]
  end
end

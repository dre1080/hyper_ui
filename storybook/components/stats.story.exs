defmodule HyperUI.Storybook.Stats do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Marketing.stats/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          title: "Trusted by eCommerce Businesses",
          subtitle: "Lorem ipsum dolor sit amet consectetur adipisicing elit."
        },
        slots: [
          """
          <:stat label="Total Sales" value="$4.8m" />
          <:stat label="Official Addons" value="24" />
          <:stat label="Total Addons" value="86" />
          """
        ]
      }
    ]
  end
end

defmodule HyperUI.Storybook.Hero do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Marketing.hero/1

  def variations do
    [
      %Variation{
        id: :split,
        attributes: %{
          variant: "split",
          title: "Understand User Flow.",
          subtitle:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et, egestas tempus tellus etiam sed.",
          image_url:
            "https://images.unsplash.com/photo-1464582883107-8adf2dcd87d6?q=80&w=1000&auto=format&fit=crop"
        },
        slots: [
          """
          <HyperUI.Components.ApplicationUI.button color="black">Get Started Today</HyperUI.Components.ApplicationUI.button>
          """
        ]
      },
      %Variation{
        id: :background,
        attributes: %{
          variant: "background",
          title: "Let us find your Forever Home.",
          subtitle:
            "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nesciunt illo tenetur fuga ducimus numquam ea!",
          image_url:
            "https://images.unsplash.com/photo-1604014237800-1c9102c219da?q=80&w=1000&auto=format&fit=crop"
        },
        slots: [
          """
          <HyperUI.Components.ApplicationUI.button color="black">Get Started</HyperUI.Components.ApplicationUI.button>
          <HyperUI.Components.ApplicationUI.button variant="outline" color="black" class="bg-white">Learn More</HyperUI.Components.ApplicationUI.button>
          """
        ]
      },
      %Variation{
        id: :centered,
        attributes: %{
          variant: "centered",
          title: "The Ultimate Component Library",
          subtitle: "Build your next project faster with HyperUI and Phoenix LiveView."
        },
        slots: [
          """
          <HyperUI.Components.ApplicationUI.button color="black">Get Started</HyperUI.Components.ApplicationUI.button>
          """
        ]
      }
    ]
  end
end

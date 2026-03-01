defmodule HyperUI.Storybook.BlogCard do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Marketing.blog_card/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          title: "How to position your site for success",
          description:
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum.",
          image_url:
            "https://images.unsplash.com/photo-1524758631624-e2822e304c36?ixlib=rb-1.2.1&auto=format&fit=crop&w=2070&q=80",
          date: "10th Oct 2022"
        }
      }
    ]
  end
end

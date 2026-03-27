defmodule HyperUI.Storybook.CollectionCard do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Ecommerce.collection_card/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          title: "Limited Edition Tee",
          price: "$18.99",
          meta: "6 Colors",
          image_url:
            "https://images.unsplash.com/photo-1523381210434-271e8be1f52b?ixlib=rb-1.2.1&auto=format&fit=crop&w=1770&q=80",
          hover_image_url:
            "https://images.unsplash.com/photo-1523381140794-a1eef18a37c7?ixlib=rb-1.2.1&auto=format&fit=crop&w=1770&q=80"
        }
      }
    ]
  end
end

defmodule HyperUI.Storybook.ProductCard do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Ecommerce.product_card/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          title: "Robot Vacuum Cleaner",
          price: "$299.00",
          image:
            "https://images.unsplash.com/photo-1523381210434-271e8be1f52b?q=80&w=1000&auto=format&fit=crop",
          url: "#"
        }
      },
      %Variation{
        id: :with_badge,
        attributes: %{
          title: "Premium Wireless Headphones",
          price: "$199.00",
          image:
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=1000&auto=format&fit=crop",
          url: "#",
          badge: "Sale"
        }
      }
    ]
  end
end

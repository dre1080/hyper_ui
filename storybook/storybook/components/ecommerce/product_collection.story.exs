defmodule HyperUI.Storybook.ProductCollection do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Ecommerce.product_collection/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          title: "Our Best Sellers",
          subtitle: "Check out what everyone is buying right now."
        },
        slots: [
          """
          <li>
            <HyperUI.Components.Ecommerce.product_card
              title="Classic Watch"
              price="$150.00"
              image="https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1000&auto=format&fit=crop"
              url="#"
            />
          </li>
          <li>
            <HyperUI.Components.Ecommerce.product_card
              title="Minimalist Backpack"
              price="$80.00"
              image="https://images.unsplash.com/photo-1553062407-98eeb64c6a62?q=80&w=1000&auto=format&fit=crop"
              url="#"
              badge="New"
            />
          </li>
          <li>
            <HyperUI.Components.Ecommerce.product_card
              title="Leather Journal"
              price="$35.00"
              image="https://images.unsplash.com/photo-1544816153-199d8bb355b1?q=80&w=1000&auto=format&fit=crop"
              url="#"
            />
          </li>
          <li>
            <HyperUI.Components.Ecommerce.product_card
              title="Ceramic Mug"
              price="$15.00"
              image="https://images.unsplash.com/photo-1514228742587-6b1558fbed20?q=80&w=1000&auto=format&fit=crop"
              url="#"
            />
          </li>
          """
        ]
      }
    ]
  end
end

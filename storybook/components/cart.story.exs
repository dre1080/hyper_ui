defmodule HyperUI.Storybook.Cart do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Ecommerce.cart/1

  def template do
    """
    <div class="p-8">
      <HyperUI.Components.ApplicationUI.button
        color="black"
        phx-click={HyperUI.Components.Ecommerce.show_cart("cart-single-default")}
      >
        Open Cart
      </HyperUI.Components.ApplicationUI.button>
      <.psb-variation/>
    </div>
    """
  end

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          show: true
        },
        slots: [
          """
          <li class="flex py-6">
            <div class="size-24 shrink-0 overflow-hidden rounded-md border border-gray-200">
              <img src="https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=150&q=80" alt="Product" class="size-full object-cover">
            </div>
            <div class="ml-4 flex flex-1 flex-col">
              <div class="flex justify-between text-base font-medium text-gray-900">
                <h3><a href="#">Classic Watch</a></h3>
                <p class="ml-4">$90.00</p>
              </div>
              <p class="mt-1 text-sm text-gray-500">Silver / Leather</p>
            </div>
          </li>
          """,
          """
          <:footer>
            <div class="flex justify-between text-base font-medium text-gray-900">
              <p>Subtotal</p>
              <p>$90.00</p>
            </div>
            <p class="mt-0.5 text-sm text-gray-500">Shipping and taxes calculated at checkout.</p>
            <div class="mt-6">
              <HyperUI.Components.ApplicationUI.button color="black" class="w-full py-3">Checkout</HyperUI.Components.ApplicationUI.button>
            </div>
            <div class="mt-6">
              <HyperUI.Components.ApplicationUI.button
                color="gray"
                class="w-full py-3"
                phx-click={HyperUI.Components.Ecommerce.hide_cart("cart-single-default")}
              >
                Close
              </HyperUI.Components.ApplicationUI.button>
            </div>
          </:footer>
          """
        ]
      }
    ]
  end
end

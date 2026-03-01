defmodule HyperUI.Storybook.QuantityInput do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Ecommerce.quantity_input/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{id: "qty", name: "quantity", value: 1}
      }
    ]
  end
end

defmodule HyperUI.Storybook.VariantSelector do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Ecommerce.variant_selector/1

  def variations do
    [
      %Variation{
        id: :size,
        attributes: %{id: "size-selector", name: "size", label: "Size", type: "button"},
        slots: [
          """
          <:option value="xs">XS</:option>
          <:option value="s" checked={true}>S</:option>
          <:option value="m">M</:option>
          <:option value="l">L</:option>
          """
        ]
      },
      %Variation{
        id: :color,
        attributes: %{id: "color-selector", name: "color", label: "Color", type: "swatch"},
        slots: [
          """
          <:option value="red" color_class="bg-red-500" />
          <:option value="blue" color_class="bg-blue-500" checked={true} />
          <:option value="green" color_class="bg-green-500" />
          """
        ]
      }
    ]
  end
end

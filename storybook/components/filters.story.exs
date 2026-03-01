defmodule HyperUI.Storybook.Filters do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.ApplicationUI.filters/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          """
          <:section title="Availability">
            <ul class="space-y-1">
              <li>
                <label for="FilterInStock" class="inline-flex items-center gap-2">
                  <input type="checkbox" id="FilterInStock" class="size-5 rounded border-gray-300" />
                  <span class="text-sm font-medium text-gray-700"> In Stock (5+) </span>
                </label>
              </li>
              <li>
                <label for="FilterOutOfStock" class="inline-flex items-center gap-2">
                  <input type="checkbox" id="FilterOutOfStock" class="size-5 rounded border-gray-300" />
                  <span class="text-sm font-medium text-gray-700"> Out of Stock (10+) </span>
                </label>
              </li>
            </ul>
          </:section>
          <:section title="Price">
            <div class="flex justify-between gap-4">
              <label for="FilterPriceFrom" class="flex items-center gap-2">
                <span class="text-sm text-gray-600">$</span>
                <input type="number" id="FilterPriceFrom" placeholder="From" class="w-full rounded-md border-gray-200 shadow-sm sm:text-sm" />
              </label>
              <label for="FilterPriceTo" class="flex items-center gap-2">
                <span class="text-sm text-gray-600">$</span>
                <input type="number" id="FilterPriceTo" placeholder="To" class="w-full rounded-md border-gray-200 shadow-sm sm:text-sm" />
              </label>
            </div>
          </:section>
          """
        ]
      }
    ]
  end
end

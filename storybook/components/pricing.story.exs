defmodule HyperUI.Storybook.Pricing do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Marketing.pricing/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          """
          <:plan name="Starter" price="$20" description="Perfect for small projects.">
            <li class="flex items-center gap-1">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-5 text-neutral-700">
                <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
              </svg>
              <span class="text-gray-700"> 10 users </span>
            </li>
          </:plan>
          <:plan name="Pro" price="$50" description="For growing businesses." highlight={true}>
            <li class="flex items-center gap-1">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-5 text-neutral-700">
                <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
              </svg>
              <span class="text-gray-700"> 50 users </span>
            </li>
          </:plan>
          <:plan name="Enterprise" price="$100" description="Custom solutions for large teams.">
            <li class="flex items-center gap-1">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-5 text-neutral-700">
                <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12.75l6 6 9-13.5" />
              </svg>
              <span class="text-gray-700"> Unlimited users </span>
            </li>
          </:plan>
          """
        ]
      }
    ]
  end
end

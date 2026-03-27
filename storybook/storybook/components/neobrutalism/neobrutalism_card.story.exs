defmodule HyperUI.Storybook.NeobrutalismCard do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Neobrutalism.neo_card/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{title: "Neobrutalism in 2024", category: "Article"},
        slots: [
          """
          Learn why bold borders and hard shadows are making a massive comeback in modern web design.
          """,
          """
          <:footer>
            Read More
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="size-4">
              <path stroke-linecap="round" stroke-linejoin="round" d="M17.25 8.25L21 12m0 0l-3.75 3.75M21 12H3" />
            </svg>
          </:footer>
          """
        ]
      }
    ]
  end
end

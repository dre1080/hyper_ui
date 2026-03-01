defmodule HyperUI.Storybook.Pagination do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.ApplicationUI.pagination/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{current_page: 1, total_pages: 5}
      },
      %Variation{
        id: :middle,
        attributes: %{current_page: 3, total_pages: 5}
      }
    ]
  end
end

defmodule HyperUI.Storybook.ProductReview do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Ecommerce.product_review/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          author_name: "Paul Jarvis",
          title: "Stayed for the quality",
          stars: 5
        },
        slots: [
          "The attention to detail in the stitching and the fabric quality is unmatched. I've washed this tee 10 times and it still looks brand new."
        ]
      }
    ]
  end
end

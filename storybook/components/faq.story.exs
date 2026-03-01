defmodule HyperUI.Storybook.Faq do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Marketing.faq/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{title: "Got Questions?"},
        slots: [
          """
          <:item question="What is HyperUI?">
            HyperUI is a free collection of open source Tailwind CSS components.
          </:item>
          <:item question="How do I use it?">
            Simply install the package and add it to your assets/css/app.css using the @source directive.
          </:item>
          """
        ]
      }
    ]
  end
end

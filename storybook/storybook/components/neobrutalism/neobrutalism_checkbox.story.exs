defmodule HyperUI.Storybook.NeobrutalismCheckbox do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Neobrutalism.neo_checkbox/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{id: "neo-check", name: "newsletter", label: "Newsletter"}
      },
      %Variation{
        id: :checked,
        attributes: %{id: "neo-check-active", name: "promo", label: "Promo Emails", checked: true}
      }
    ]
  end
end

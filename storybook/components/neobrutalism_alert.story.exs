defmodule HyperUI.Storybook.NeobrutalismAlert do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Neobrutalism.alert/1

  def variations do
    [
      %Variation{
        id: :success,
        attributes: %{kind: "success", title: "Changes saved!"},
        slots: ["Your product changes have been saved successfully."]
      },
      %Variation{
        id: :info,
        attributes: %{kind: "info", title: "New Update"},
        slots: ["A new version is available."]
      },
      %Variation{
        id: :error,
        attributes: %{kind: "error", title: "Error!"},
        slots: ["Something went wrong with your request."]
      }
    ]
  end
end

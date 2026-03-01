defmodule HyperUI.Storybook.Alert do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.ApplicationUI.alert/1

  def variations do
    [
      %Variation{
        id: :success,
        attributes: %{kind: "success", title: "Changes saved"},
        slots: ["Your product changes have been saved successfully."]
      },
      %Variation{
        id: :error,
        attributes: %{kind: "error", title: "Something went wrong"},
        slots: ["Please check your internet connection and try again."]
      },
      %Variation{
        id: :info,
        attributes: %{kind: "info", title: "New Update Available"},
        slots: ["A new version of the dashboard is ready to install."]
      }
    ]
  end
end

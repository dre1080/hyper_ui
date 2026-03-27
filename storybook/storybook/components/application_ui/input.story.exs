defmodule HyperUI.Storybook.Input do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.ApplicationUI.Forms.input/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          id: "input-default",
          name: "example",
          label: "Email Address",
          placeholder: "john@doe.com"
        }
      },
      %Variation{
        id: :with_error,
        attributes: %{
          id: "input-error",
          name: "example",
          label: "Email Address",
          value: "invalid-email",
          errors: ["Email address is invalid"]
        }
      }
    ]
  end
end

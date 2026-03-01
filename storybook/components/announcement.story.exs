defmodule HyperUI.Storybook.Announcement do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Marketing.announcement/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          """
          Love HyperUI? <a href="#" class="inline-block underline">Check out the new components!</a>
          """
        ]
      }
    ]
  end
end

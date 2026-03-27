defmodule HyperUI.Storybook.NeobrutalismTabs do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Neobrutalism.neo_tabs/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          """
          <:tab title="Settings" active={true} color="pink" />
          <:tab title="Messages" />
          <:tab title="Archive" />
          """
        ]
      }
    ]
  end
end

defmodule HyperUI.Storybook.Footer do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Marketing.footer/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          """
          <div class="flex gap-6">
            <a href="#" class="text-gray-500 hover:opacity-75">About</a>
            <a href="#" class="text-gray-500 hover:opacity-75">Services</a>
            <a href="#" class="text-gray-500 hover:opacity-75">Contact</a>
          </div>
          """
        ]
      }
    ]
  end
end

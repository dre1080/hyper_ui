defmodule HyperUI.Storybook.EmptyState do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.ApplicationUI.empty_state/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          title: "No projects found",
          subtitle: "You haven't created any projects yet."
        },
        slots: [
          """
          <:icon>
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
              <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v6m3-3H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
          </:icon>
          <HyperUI.Components.ApplicationUI.button color="black" class="mt-4">Create your first project</HyperUI.Components.ApplicationUI.button>
          """
        ]
      }
    ]
  end
end

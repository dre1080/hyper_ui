defmodule HyperUI.Storybook.Modal do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.ApplicationUI.modal/1

  def template do
    """
    <div class="p-8">
      <HyperUI.Components.ApplicationUI.button
        color="blue"
        phx-click={HyperUI.Components.ApplicationUI.show_modal("modal-single-default")}
      >
        Open Modal
      </HyperUI.Components.ApplicationUI.button>
      <.psb-variation/>
    </div>
    """
  end

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          show: true
        },
        slots: [
          """
          <:title>Modal Title</:title>
          <p class="text-gray-500">This is the modal body content. It can contain any HEEx template.</p>
          <:footer>
            <HyperUI.Components.ApplicationUI.button color="gray" phx-click={HyperUI.Components.ApplicationUI.hide_modal("modal-single-default")}>Cancel</HyperUI.Components.ApplicationUI.button>
            <HyperUI.Components.ApplicationUI.button color="black">Confirm</HyperUI.Components.ApplicationUI.button>
          </:footer>
          """
        ]
      }
    ]
  end
end

defmodule HyperUI.Components.ApplicationUI.Forms do
  @moduledoc """
  Form components from HyperUI.
  Includes text inputs, checkboxes, radios, selects, and toggles.
  """
  use Phoenix.Component

  @doc """
  Renders a text input component.

  ## Examples

  ### Basic Usage
  ```heex
  <.input type="email" name="user[email]" id="user_email" label="Email Address" />
  ```

  ### With Error
  ```heex
  <.input id="user_email" name="user[email]" value="invalid" errors={["is invalid"]} />
  ```
  """
  attr(:id, :string, required: true)
  attr(:name, :string, required: true)
  attr(:type, :string, default: "text")
  attr(:label, :string, default: nil)
  attr(:value, :any, default: nil)
  attr(:errors, :list, default: [])
  attr(:class, :string, default: nil)
  attr(:rest, :global)

  @spec input(map()) :: Phoenix.LiveView.Rendered.t()
  def input(assigns) do
    ~H"""
    <div class={@class}>
      <%= if @label do %>
        <label for={@id} class="block text-xs font-medium text-gray-700">
          <%= @label %>
        </label>
      <% end %>

      <input
        type={@type}
        id={@id}
        name={@name}
        value={@value}
        class={[
          "mt-1 w-full rounded-md shadow-sm sm:text-sm",
          if(@errors == [],
            do: "border-gray-200 focus:border-blue-500 focus:ring-blue-500",
            else:
              "border-red-500 text-red-900 focus:border-red-500 focus:ring-red-500"
          )
        ]}
        {@rest}
      />

      <%= for error <- @errors do %>
        <p class="mt-1 text-xs text-red-500">
          <%= error %>
        </p>
      <% end %>
    </div>
    """
  end

  @doc """
  Renders a toggle/switch component.

  ## Examples

  ### Basic Usage
  ```heex
  <.toggle id="marketing" name="marketing" checked={false} />
  ```

  ### Checked
  ```heex
  <.toggle id="notifications" name="notifications" checked={true} />
  ```
  """
  attr(:id, :string, required: true)
  attr(:name, :string, required: true)
  attr(:checked, :boolean, default: false)
  attr(:class, :string, default: nil)
  attr(:rest, :global)

  @spec toggle(map()) :: Phoenix.LiveView.Rendered.t()
  def toggle(assigns) do
    ~H"""
    <label
      for={@id}
      class={[
        "relative inline-block h-8 w-14 cursor-pointer rounded-full bg-gray-300 transition [-webkit-tap-highlight-color:_transparent] has-[:checked]:bg-green-500",
        @class
      ]}
    >
      <input type="checkbox" id={@id} name={@name} class="peer sr-only" checked={@checked} {@rest} />

      <span class="absolute inset-y-0 start-0 m-1 size-6 rounded-full bg-white transition-all peer-checked:start-6">
      </span>
    </label>
    """
  end
end

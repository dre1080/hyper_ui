defmodule HyperUI.Components.Neobrutalism do
  @moduledoc """
  Neo-Brutalism components from HyperUI.
  Characterized by bold black borders, vibrant colors, and hard shadows.
  """
  use Phoenix.Component

  @doc """
  Renders a Neo-Brutalism button.

  ## Examples

  ### Standard
  ```heex
  <.button color="yellow">Get Started</.button>
  ```

  ### Pressed Style
  ```heex
  <.button color="pink" variant="pressed">Click Me</.button>
  ```
  """
  attr :color, :string, default: "yellow"
  attr :variant, :string, default: "base", values: ~w(base pressed underline)
  attr :type, :string, default: "button"
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  @spec button(map()) :: Phoenix.LiveView.Rendered.t()
  def button(assigns) do
    ~H"""
    <button
      type={@type}
      class={[
        "inline-block rounded border-2 border-black px-8 py-3 text-sm font-bold text-black transition-all focus:outline-none focus:ring",
        button_color_classes(@color),
        button_variant_classes(@variant),
        @class
      ]}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end

  defp button_color_classes("yellow"), do: "bg-yellow-400"
  defp button_color_classes("pink"), do: "bg-pink-500"
  defp button_color_classes("cyan"), do: "bg-cyan-400"
  defp button_color_classes("emerald"), do: "bg-emerald-400"
  defp button_color_classes("white"), do: "bg-white"
  defp button_color_classes(_), do: "bg-yellow-400"

  defp button_variant_classes("base"),
    do:
      "shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] hover:translate-x-[2px] hover:translate-y-[2px] hover:shadow-none active:translate-x-[4px] active:translate-y-[4px]"

  defp button_variant_classes("pressed"), do: "shadow-[inset_4px_4px_0px_0px_rgba(0,0,0,1)]"

  defp button_variant_classes("underline"),
    do: "border-b-4 hover:bg-opacity-90 active:border-b-0 active:translate-y-[4px]"

  @doc """
  Renders a Neo-Brutalism input.
  """
  attr :id, :string, required: true
  attr :name, :string, required: true
  attr :label, :string, default: nil
  attr :value, :any, default: nil
  attr :type, :string, default: "text"
  attr :placeholder, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global

  @spec input(map()) :: Phoenix.LiveView.Rendered.t()
  def input(assigns) do
    ~H"""
    <div class={@class}>
      <%= if @label do %>
        <label for={@id} class="block text-xs font-bold text-black uppercase">
          <%= @label %>
        </label>
      <% end %>

      <input
        type={@type}
        id={@id}
        name={@name}
        value={@value}
        placeholder={@placeholder}
        class="mt-1 w-full border-2 border-black bg-white p-3 font-bold text-black shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] transition-all focus:translate-x-[2px] focus:translate-y-[2px] focus:shadow-none focus:outline-none"
        {@rest}
      />
    </div>
    """
  end

  @doc """
  Renders a Neo-Brutalism badge.
  """
  attr :color, :string, default: "yellow"
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  @spec badge(map()) :: Phoenix.LiveView.Rendered.t()
  def badge(assigns) do
    ~H"""
    <span
      class={[
        "inline-block border-2 border-black px-3 py-1 text-xs font-black uppercase tracking-widest text-black shadow-[2px_2px_0px_0px_rgba(0,0,0,1)]",
        button_color_classes(@color),
        @class
      ]}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </span>
    """
  end

  @doc """
  Renders a Neo-Brutalism accordion.
  """
  attr :title, :string, required: true
  attr :open, :boolean, default: false
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  @spec accordion(map()) :: Phoenix.LiveView.Rendered.t()
  def accordion(assigns) do
    ~H"""
    <details
      class={[
        "group border-2 border-black bg-white shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] open:shadow-none open:translate-x-[3px] open:translate-y-[3px]",
        @class
      ]}
      open={@open}
      {@rest}
    >
      <summary class="flex cursor-pointer items-center justify-between gap-1.5 p-4 text-black">
        <h2 class="font-bold"><%= @title %></h2>
        <svg
          class="size-5 shrink-0 transition duration-300 group-open:-rotate-180"
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
        >
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
        </svg>
      </summary>
      <div class="px-4 pb-4 leading-relaxed text-black/80">
        <%= render_slot(@inner_block) %>
      </div>
    </details>
    """
  end

  @doc """
  Renders a Neo-Brutalism progress bar.
  """
  attr :value, :integer, required: true
  attr :max, :integer, default: 100
  attr :color, :string, default: "yellow"
  attr :class, :string, default: nil
  attr :rest, :global

  @spec progress(map()) :: Phoenix.LiveView.Rendered.t()
  def progress(assigns) do
    ~H"""
    <div class={@class} {@rest}>
      <span role="progressbar" class="block border-2 border-black bg-white p-1 shadow-[4px_4px_0px_0px_rgba(0,0,0,1)]">
        <span
          class={["block h-4 border-r-2 border-black", button_color_classes(@color)]}
          style={"width: #{(@value / @max) * 100}%"}
        >
        </span>
      </span>
    </div>
    """
  end

  @doc """
  Renders a Neo-Brutalism select.
  """
  attr :id, :string, required: true
  attr :name, :string, required: true
  attr :label, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  @spec select(map()) :: Phoenix.LiveView.Rendered.t()
  def select(assigns) do
    ~H"""
    <div class={@class}>
      <%= if @label do %>
        <label for={@id} class="block text-sm font-bold text-black uppercase"> <%= @label %> </label>
      <% end %>
      <select
        id={@id}
        name={@name}
        class="mt-1.5 w-full border-2 border-black bg-white p-3 font-bold text-black shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] focus:outline-none focus:ring-0"
        {@rest}
      >
        <%= render_slot(@inner_block) %>
      </select>
    </div>
    """
  end

  @doc """
  Renders a Neo-Brutalism textarea.
  """
  attr :id, :string, required: true
  attr :name, :string, required: true
  attr :label, :string, default: nil
  attr :placeholder, :string, default: nil
  attr :rows, :integer, default: 4
  attr :class, :string, default: nil
  attr :rest, :global

  @spec textarea(map()) :: Phoenix.LiveView.Rendered.t()
  def textarea(assigns) do
    ~H"""
    <div class={@class}>
      <%= if @label do %>
        <label for={@id} class="block text-sm font-bold text-black uppercase"> <%= @label %> </label>
      <% end %>
      <textarea
        id={@id}
        name={@name}
        rows={@rows}
        placeholder={@placeholder}
        class="mt-2 w-full border-2 border-black bg-white p-3 font-medium text-black shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] focus:outline-none sm:text-sm"
        {@rest}
      ></textarea>
    </div>
    """
  end

  @doc """
  Renders Neo-Brutalism tabs.
  """
  attr :class, :string, default: nil
  attr :rest, :global

  slot :tab, required: true do
    attr :title, :string, required: true
    attr :active, :boolean
    attr :color, :string
  end

  @spec tabs(map()) :: Phoenix.LiveView.Rendered.t()
  def tabs(assigns) do
    ~H"""
    <div class={["flex flex-wrap gap-4 border-b-2 border-black pb-4", @class]} {@rest}>
      <%= for tab <- @tab do %>
        <button class={[
          "border-2 border-black px-4 py-2 font-bold text-black transition-all",
          if(Map.get(tab, :active, false),
            do: [button_color_classes(Map.get(tab, :color, "pink")), "shadow-none translate-x-[3px] translate-y-[3px]"],
            else: "bg-white shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] hover:shadow-none hover:translate-x-[2px] hover:translate-y-[2px]"
          )
        ]}>
          <%= tab.title %>
        </button>
      <% end %>
    </div>
    """
  end

  @doc """
  Renders a Neo-Brutalism alert.
  """
  attr :kind, :string, default: "info"
  attr :title, :string, default: nil
  attr :color, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  @spec alert(map()) :: Phoenix.LiveView.Rendered.t()
  def alert(assigns) do
    ~H"""
    <div
      role="alert"
      class={[
        "border-2 border-black p-4 shadow-[4px_4px_0px_0px_rgba(0,0,0,1)]",
        button_color_classes(@color || alert_default_color(@kind)),
        @class
      ]}
      {@rest}
    >
      <div class="flex items-start gap-4">
        <span class="text-black">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="size-6">
            <path stroke-linecap="round" stroke-linejoin="round" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
        </span>
        <div class="flex-1">
          <%= if @title do %>
            <strong class="block font-bold text-black"> <%= @title %> </strong>
          <% end %>
          <p class="mt-1 text-sm text-black/80">
            <%= render_slot(@inner_block) %>
          </p>
        </div>
      </div>
    </div>
    """
  end

  defp alert_default_color("info"), do: "cyan"
  defp alert_default_color("success"), do: "emerald"
  defp alert_default_color("error"), do: "pink"
  defp alert_default_color(_), do: "yellow"

  @doc """
  Renders a Neo-Brutalism checkbox.
  """
  attr :id, :string, required: true
  attr :name, :string, required: true
  attr :label, :string, default: nil
  attr :checked, :boolean, default: false
  attr :class, :string, default: nil
  attr :rest, :global

  @spec checkbox(map()) :: Phoenix.LiveView.Rendered.t()
  def checkbox(assigns) do
    ~H"""
    <label for={@id} class={["flex cursor-pointer items-start gap-4", @class]}>
      <div class="flex items-center">
        &#8203;
        <input
          type="checkbox"
          id={@id}
          name={@name}
          checked={@checked}
          class="size-5 border-2 border-black bg-white shadow-[2px_2px_0px_0px_rgba(0,0,0,1)] checked:bg-yellow-400 focus:ring-0 focus:ring-offset-0 appearance-none checked:after:content-['✓'] checked:after:flex checked:after:justify-center checked:after:items-center checked:after:font-bold"
          {@rest}
        />
      </div>
      <%= if @label do %>
        <div>
          <strong class="font-bold text-black"> <%= @label %> </strong>
        </div>
      <% end %>
    </label>
    """
  end

  @doc """
  Renders a Neo-Brutalism card.
  """
  attr :title, :string, default: nil
  attr :category, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true
  slot :footer

  @spec card(map()) :: Phoenix.LiveView.Rendered.t()
  def card(assigns) do
    ~H"""
    <article
      class={[
        "group border-2 border-black bg-white p-6 shadow-[8px_8px_0px_0px_rgba(0,0,0,1)] transition-all hover:shadow-none hover:translate-x-[4px] hover:translate-y-[4px]",
        @class
      ]}
      {@rest}
    >
      <%= if @category do %>
        <span class="inline-block border-2 border-black bg-pink-400 px-3 py-1 text-xs font-bold uppercase tracking-widest text-black">
          <%= @category %>
        </span>
      <% end %>

      <%= if @title do %>
        <h3 class="mt-4 text-xl font-bold text-black sm:text-2xl">
          <%= @title %>
        </h3>
      <% end %>

      <div class="mt-2 text-black/70">
        <%= render_slot(@inner_block) %>
      </div>

      <%= if @footer != [] do %>
        <div class="mt-6 flex items-center gap-2 font-bold text-black underline decoration-2 underline-offset-4">
          <%= render_slot(@footer) %>
        </div>
      <% end %>
    </article>
    """
  end
end

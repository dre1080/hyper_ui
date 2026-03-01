defmodule HyperUI.Components.ApplicationUI do
  @moduledoc """
  Application UI components from HyperUI.
  Includes core primitives like badges, buttons, alerts, and more.
  """
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  @doc """
  Renders a badge component.

  ## Examples

  ### Standard
  ```heex
  <.badge>Live</.badge>
  ```

  ### Colors
  ```heex
  <.badge color="purple">Purple</.badge>
  <.badge color="emerald">Success</.badge>
  ```
  """
  attr :color, :string, default: "gray"
  attr :size, :string, default: "md"
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  @spec badge(map()) :: Phoenix.LiveView.Rendered.t()
  def badge(assigns) do
    ~H"""
    <span
      class={[
        "whitespace-nowrap rounded-full px-2.5 py-0.5 font-medium",
        badge_color_classes(@color),
        badge_size_classes(@size),
        @class
      ]}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </span>
    """
  end

  defp badge_size_classes("sm"), do: "text-[10px]"
  defp badge_size_classes("md"), do: "text-sm"
  defp badge_size_classes("lg"), do: "text-base"

  defp badge_color_classes("black"), do: "bg-black text-white"
  defp badge_color_classes("gray"), do: "bg-gray-100 text-gray-700"
  defp badge_color_classes("purple"), do: "bg-purple-100 text-purple-700"
  defp badge_color_classes("emerald"), do: "bg-emerald-100 text-emerald-700"
  defp badge_color_classes("amber"), do: "bg-amber-100 text-amber-700"
  defp badge_color_classes("red"), do: "bg-red-100 text-red-700"
  defp badge_color_classes("blue"), do: "bg-blue-100 text-blue-700"
  defp badge_color_classes("indigo"), do: "bg-indigo-100 text-indigo-700"

  @doc """
  Renders a button component.

  ## Examples

  ### Primary
  ```heex
  <.button>Download</.button>
  ```

  ### Variants
  ```heex
  <.button variant="outline">Secondary</.button>
  ```
  """
  attr :type, :string, default: "button"
  attr :variant, :string, default: "solid"
  attr :color, :string, default: "black"
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  @spec button(map()) :: Phoenix.LiveView.Rendered.t()
  def button(assigns) do
    ~H"""
    <button
      type={@type}
      class={[
        "inline-block rounded-sm px-12 py-3 text-sm font-medium transition focus:ring-3 focus:outline-hidden",
        button_variant_classes(@variant, @color),
        @class
      ]}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end

  defp button_variant_classes("solid", "black"),
    do: "border border-black bg-black text-white hover:bg-transparent hover:text-black"

  defp button_variant_classes("solid", "gray"),
    do: "border border-gray-600 bg-gray-600 text-white hover:bg-transparent hover:text-gray-600"

  defp button_variant_classes("solid", "blue"),
    do: "border border-blue-600 bg-blue-600 text-white hover:bg-transparent hover:text-blue-600"

  defp button_variant_classes("solid", "red"),
    do: "border border-red-600 bg-red-600 text-white hover:bg-transparent hover:text-red-600"

  defp button_variant_classes("solid", "indigo"),
    do:
      "border border-indigo-600 bg-indigo-600 text-white hover:bg-transparent hover:text-indigo-600"

  defp button_variant_classes("solid", "emerald"),
    do:
      "border border-emerald-600 bg-emerald-600 text-white hover:bg-transparent hover:text-emerald-600"

  defp button_variant_classes("outline", "black"),
    do: "border border-black text-black hover:bg-black hover:text-white"

  defp button_variant_classes("outline", "gray"),
    do: "border border-gray-600 text-gray-600 hover:bg-gray-600 hover:text-white"

  defp button_variant_classes("outline", "blue"),
    do: "border border-blue-600 text-blue-600 hover:bg-blue-600 hover:text-white"

  defp button_variant_classes("outline", "red"),
    do: "border border-red-600 text-red-600 hover:bg-red-600 hover:text-white"

  defp button_variant_classes("outline", "indigo"),
    do: "border border-indigo-600 text-indigo-600 hover:bg-indigo-600 hover:text-white"

  defp button_variant_classes("outline", "emerald"),
    do: "border border-emerald-600 text-emerald-600 hover:bg-emerald-600 hover:text-white"

  defp button_variant_classes("outline", _),
    do: "border border-black text-black hover:bg-black hover:text-white"

  defp button_variant_classes(_, _),
    do: "border border-black bg-black text-white hover:bg-transparent hover:text-black"

  @doc """
  Renders an alert component.

  ## Examples

  ### Success
  ```heex
  <.alert kind="success" title="Changes saved">Your changes have been saved.</.alert>
  ```
  """
  attr :kind, :string, default: "info"
  attr :title, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  @spec alert(map()) :: Phoenix.LiveView.Rendered.t()
  def alert(assigns) do
    ~H"""
    <div
      role="alert"
      class={[
        "rounded-xl border p-4",
        alert_container_classes(@kind),
        @class
      ]}
      {@rest}
    >
      <div class="flex items-start gap-4">
        <span class={alert_icon_classes(@kind)}>
          <%= if @kind == "success" do %>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              stroke-width="1.5"
              stroke="currentColor"
              class="size-6"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
              />
            </svg>
          <% end %>
          <%= if @kind == "error" do %>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              stroke-width="1.5"
              stroke="currentColor"
              class="size-6"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"
              />
            </svg>
          <% end %>
          <%= if @kind == "info" do %>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              stroke-width="1.5"
              stroke="currentColor"
              class="size-6"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M11.25 11.25l.041-.02a.75.75 0 011.063.852l-.708 2.836a.75.75 0 001.063.853l.041-.021M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9-3.75h.008v.008H12V8.25z"
              />
            </svg>
          <% end %>
        </span>

        <div class="flex-1">
          <strong class="block font-medium text-gray-900"> <%= @title %> </strong>
          <p class="mt-1 text-sm text-gray-700">
            <%= render_slot(@inner_block) %>
          </p>
        </div>

        <button class="text-gray-500 transition hover:text-gray-600">
          <span class="sr-only">Dismiss popup</span>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke-width="1.5"
            stroke="currentColor"
            class="size-5"
          >
            <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>
      </div>
    </div>
    """
  end

  defp alert_container_classes("success"), do: "border-gray-100 bg-white"
  defp alert_container_classes("error"), do: "border-red-100 bg-red-50"
  defp alert_container_classes("info"), do: "border-blue-100 bg-blue-50"
  defp alert_container_classes(_), do: "border-gray-100 bg-white"

  defp alert_icon_classes("success"), do: "text-green-600"
  defp alert_icon_classes("error"), do: "text-red-600"
  defp alert_icon_classes("info"), do: "text-blue-600"
  defp alert_icon_classes(_), do: "text-gray-600"

  @doc """
  Renders a filter sidebar/section.
  """
  attr :class, :string, default: nil
  attr :rest, :global

  slot :section do
    attr :title, :string, required: true
  end

  @spec filters(map()) :: Phoenix.LiveView.Rendered.t()
  def filters(assigns) do
    ~H"""
    <div class={["space-y-2", @class]} {@rest}>
      <%= for section <- @section do %>
        <details class="overflow-hidden rounded border border-gray-300 [&_summary::-webkit-details-marker]:hidden">
          <summary class="flex cursor-pointer items-center justify-between gap-2 bg-white p-4 text-gray-900 transition">
            <span class="text-sm font-medium"> <%= section.title %> </span>

            <span class="transition group-open:-rotate-180">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-4"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
              </svg>
            </span>
          </summary>

          <div class="border-t border-gray-200 bg-white">
            <header class="flex items-center justify-between p-4">
              <span class="text-sm text-gray-700"> 0 Selected </span>

              <button type="button" class="text-sm text-gray-900 underline underline-offset-4">
                Reset
              </button>
            </header>

            <div class="p-4 pt-0">
              <%= render_slot(section) %>
            </div>
          </div>
        </details>
      <% end %>
    </div>
    """
  end

  @doc """
  Renders a table component.
  """
  attr :rows, :list, required: true
  attr :class, :string, default: nil
  attr :rest, :global

  slot :col, required: true do
    attr :label, :string, required: true
  end

  @spec table(map()) :: Phoenix.LiveView.Rendered.t()
  def table(assigns) do
    ~H"""
    <div class={["overflow-x-auto rounded-lg border border-gray-200", @class]} {@rest}>
      <table class="min-w-full divide-y-2 divide-gray-200 bg-white text-sm">
        <thead class="ltr:text-left rtl:text-right">
          <tr>
            <%= for col <- @col do %>
              <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                <%= col.label %>
              </th>
            <% end %>
          </tr>
        </thead>

        <tbody class="divide-y divide-gray-200">
          <%= for row <- @rows do %>
            <tr>
              <%= for col <- @col do %>
                <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                  <%= render_slot(col, row) %>
                </td>
              <% end %>
            </tr>
          <% end %>
        </tbody>
      </table>
    </div>
    """
  end

  @doc """
  Renders a tabs component.
  """
  attr :class, :string, default: nil
  attr :rest, :global

  slot :tab, required: true do
    attr :title, :string, required: true
    attr :active, :boolean
    attr :url, :string
  end

  @spec tabs(map()) :: Phoenix.LiveView.Rendered.t()
  def tabs(assigns) do
    ~H"""
    <div class={@class} {@rest}>
      <div class="sm:hidden">
        <label for="Tab" class="sr-only">Tab</label>
        <select id="Tab" class="w-full rounded-md border-gray-200">
          <%= for tab <- @tab do %>
            <option selected={Map.get(tab, :active, false)}><%= tab.title %></option>
          <% end %>
        </select>
      </div>

      <div class="hidden sm:block">
        <nav class="flex gap-6" aria-label="Tabs">
          <%= for tab <- @tab do %>
            <a
              href={tab[:url] || "#"}
              class={[
                "shrink-0 rounded-lg p-2 text-sm font-medium",
                if(Map.get(tab, :active, false), do: "bg-sky-100 text-sky-600", else: "text-gray-500 hover:bg-gray-50 hover:text-gray-700")
              ]}
              aria-current={if Map.get(tab, :active, false), do: "page", else: nil}
            >
              <%= tab.title %>
            </a>
          <% end %>
        </nav>
      </div>
    </div>
    """
  end

  @doc """
  Renders a vertical menu component.
  """
  attr :class, :string, default: nil
  attr :rest, :global

  slot :item, required: true do
    attr :title, :string, required: true
    attr :active, :boolean
    attr :url, :string
  end

  @spec vertical_menu(map()) :: Phoenix.LiveView.Rendered.t()
  def vertical_menu(assigns) do
    ~H"""
    <ul class={["space-y-1", @class]} {@rest}>
      <%= for item <- @item do %>
        <li>
          <a
            href={item[:url] || "#"}
            class={[
              "block rounded-lg px-4 py-2 text-sm font-medium",
              if(Map.get(item, :active, false), do: "bg-gray-100 text-gray-700", else: "text-gray-500 hover:bg-gray-100 hover:text-gray-700")
            ]}
          >
            <%= item.title %>
          </a>
        </li>
      <% end %>
    </ul>
    """
  end

  @doc """
  Renders a divider component.
  """
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block

  @spec divider(map()) :: Phoenix.LiveView.Rendered.t()
  def divider(assigns) do
    ~H"""
    <span class={["flex items-center", @class]} {@rest}>
      <span class="h-px flex-1 bg-gray-200"></span>
      <%= if @inner_block != [] do %>
        <span class="shrink-0 px-6 text-sm text-gray-500 font-medium"><%= render_slot(@inner_block) %></span>
        <span class="h-px flex-1 bg-gray-200"></span>
      <% end %>
    </span>
    """
  end

  @doc """
  Renders an empty state component.
  """
  attr :title, :string, required: true
  attr :subtitle, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :icon
  slot :inner_block

  @spec empty_state(map()) :: Phoenix.LiveView.Rendered.t()
  def empty_state(assigns) do
    ~H"""
    <div class={["flex h-[450px] flex-col items-center justify-center rounded-lg border-2 border-dashed border-gray-300 p-12 text-center", @class]} {@rest}>
      <%= if @icon != [] do %>
        <span class="rounded-full bg-blue-100 p-3 text-blue-600">
          <%= render_slot(@icon) %>
        </span>
      <% end %>

      <h2 class="mt-6 text-xl font-bold text-gray-900"><%= @title %></h2>

      <%= if @subtitle do %>
        <p class="mt-2 text-sm text-gray-500">
          <%= @subtitle %>
        </p>
      <% end %>

      <div class="mt-8">
        <%= render_slot(@inner_block) %>
      </div>
    </div>
    """
  end

  @doc """
  Renders a steps component.
  """
  attr :class, :string, default: nil
  attr :rest, :global

  slot :step, required: true do
    attr :title, :string, required: true
    attr :active, :boolean
  end

  @spec steps(map()) :: Phoenix.LiveView.Rendered.t()
  def steps(assigns) do
    ~H"""
    <div class={@class} {@rest}>
      <h2 class="sr-only">Steps</h2>

      <div class="after:mt-4 after:block after:h-1 after:w-full after:rounded-lg after:bg-gray-200">
        <ol class="grid grid-cols-3 text-sm font-medium text-gray-500">
          <%= for step <- @step do %>
            <li class={[
              "relative flex justify-center",
              if(Map.get(step, :active, false), do: "text-blue-600", else: "")
            ]}>
              <span class={[
                "absolute -bottom-[1.75rem] start-1/2 -translate-x-1/2 rounded-full text-white",
                if(Map.get(step, :active, false), do: "bg-blue-600", else: "bg-gray-600")
              ]}>
                <svg
                  class="size-5"
                  xmlns="http://www.w3.org/2000/svg"
                  viewBox="0 0 20 20"
                  fill="currentColor"
                >
                  <path
                    fill-rule="evenodd"
                    d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                    clip-rule="evenodd"
                  />
                </svg>
              </span>

              <span class="hidden sm:block"> <%= step.title %> </span>
            </li>
          <% end %>
        </ol>
      </div>
    </div>
    """
  end

  @doc """
  Renders a dropdown menu.

  ## Examples

  ### Basic Usage
  ```heex
  <.dropdown id="my-dropdown">
    <:toggle>Options</:toggle>
    <:item url="/profile">Profile</:item>
    <:item phx-click="logout">Logout</:item>
  </.dropdown>
  ```
  """
  attr :id, :string, required: true
  attr :class, :string, default: nil
  attr :rest, :global

  slot :toggle, required: true

  slot :item do
    attr :url, :string
    attr :class, :string
  end

  @spec dropdown(map()) :: Phoenix.LiveView.Rendered.t()
  def dropdown(assigns) do
    ~H"""
    <div class={["relative inline-block text-left", @class]} {@rest}>
      <div>
        <button
          type="button"
          class="inline-flex w-full justify-center gap-x-1.5 rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
          id={"#{@id}-button"}
          phx-click={JS.toggle(to: "##{@id}-menu")}
          phx-click-away={JS.hide(to: "##{@id}-menu")}
        >
          <%= render_slot(@toggle) %>
          <svg class="-mr-1 size-5 text-gray-400" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
            <path fill-rule="evenodd" d="M5.22 8.22a.75.75 0 0 1 1.06 0L10 11.94l3.72-3.72a.75.75 0 1 1 1.06 1.06l-4.25 4.25a.75.75 0 0 1-1.06 0L5.22 9.28a.75.75 0 0 1 0-1.06Z" clip-rule="evenodd" />
          </svg>
        </button>
      </div>

      <div
        class="absolute right-0 z-10 mt-2 w-56 origin-top-right rounded-md bg-white shadow-lg ring-1 ring-black/5 focus:outline-none hidden"
        id={"#{@id}-menu"}
        role="menu"
        aria-orientation="vertical"
        aria-labelledby={"#{@id}-button"}
        tabindex="-1"
      >
        <div class="py-1" role="none">
          <%= for item <- @item do %>
            <%= if item[:url] do %>
              <a
                href={item.url}
                class={["block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100", item[:class]]}
                role="menuitem"
                tabindex="-1"
                {@rest}
              >
                <%= render_slot(item) %>
              </a>
            <% else %>
              <button
                type="button"
                class={["block w-full text-left px-4 py-2 text-sm text-gray-700 hover:bg-gray-100", item[:class]]}
                role="menuitem"
                tabindex="-1"
                {@rest}
              >
                <%= render_slot(item) %>
              </button>
            <% end %>
          <% end %>
        </div>
      </div>
    </div>
    """
  end

  @doc """
  Renders a button group.
  """
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  @spec button_group(map()) :: Phoenix.LiveView.Rendered.t()
  def button_group(assigns) do
    ~H"""
    <div class={["inline-flex rounded-md shadow-sm", @class]} role="group" {@rest}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  @doc """
  Renders breadcrumbs.
  """
  attr :class, :string, default: nil
  attr :rest, :global

  slot :item, required: true do
    attr :url, :string
  end

  @spec breadcrumbs(map()) :: Phoenix.LiveView.Rendered.t()
  def breadcrumbs(assigns) do
    ~H"""
    <nav aria-label="Breadcrumb" class={@class} {@rest}>
      <ol class="flex items-center gap-1 text-sm text-gray-600">
        <%= for {item, index} <- Enum.with_index(@item) do %>
          <li>
            <%= if item[:url] do %>
              <a href={item.url} class="block transition hover:text-gray-700">
                <%= render_slot(item) %>
              </a>
            <% else %>
              <span class="block transition hover:text-gray-700">
                <%= render_slot(item) %>
              </span>
            <% end %>
          </li>

          <%= if index < length(@item) - 1 do %>
            <li class="rtl:rotate-180">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="size-4"
                viewBox="0 0 20 20"
                fill="currentColor"
              >
                <path
                  fill-rule="evenodd"
                  d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                  clip-rule="evenodd"
                />
              </svg>
            </li>
          <% end %>
        <% end %>
      </ol>
    </nav>
    """
  end

  @doc """
  Renders pagination.
  """
  attr :current_page, :integer, required: true
  attr :total_pages, :integer, required: true
  attr :class, :string, default: nil
  attr :rest, :global

  @spec pagination(map()) :: Phoenix.LiveView.Rendered.t()
  def pagination(assigns) do
    ~H"""
    <ol class={["flex justify-center gap-1 text-xs font-medium", @class]} {@rest}>
      <li>
        <a
          href="#"
          class="inline-flex size-8 items-center justify-center rounded border border-gray-100 bg-white text-gray-900 rtl:rotate-180"
        >
          <span class="sr-only">Prev Page</span>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="size-3"
            viewBox="0 0 20 20"
            fill="currentColor"
          >
            <path
              fill-rule="evenodd"
              d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
              clip-rule="evenodd"
            />
          </svg>
        </a>
      </li>

      <%= for page <- 1..@total_pages do %>
        <li>
          <%= if page == @current_page do %>
            <span class="block size-8 rounded border-black bg-black text-center leading-8 text-white">
              <%= page %>
            </span>
          <% else %>
            <a
              href="#"
              class="block size-8 rounded border border-gray-100 bg-white text-center leading-8 text-gray-900"
            >
              <%= page %>
            </a>
          <% end %>
        </li>
      <% end %>

      <li>
        <a
          href="#"
          class="inline-flex size-8 items-center justify-center rounded border border-gray-100 bg-white text-gray-900 rtl:rotate-180"
        >
          <span class="sr-only">Next Page</span>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="size-3"
            viewBox="0 0 20 20"
            fill="currentColor"
          >
            <path
              fill-rule="evenodd"
              d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
              clip-rule="evenodd"
            />
          </svg>
        </a>
      </li>
    </ol>
    """
  end

  @doc """
  Renders a modal.
  """
  attr :id, :string, required: true
  attr :show, :boolean, default: false
  attr :on_cancel, Phoenix.LiveView.JS
  slot :title
  slot :inner_block, required: true
  slot :footer

  @spec modal(map()) :: Phoenix.LiveView.Rendered.t()
  def modal(assigns) do
    assigns =
      assign_new(assigns, :on_cancel, fn ->
        hide_modal(assigns.id)
      end)

    ~H"""
    <div
      id={@id}
      phx-mounted={@show && show_modal(@id)}
      phx-remove={hide_modal(@id)}
      data-cancel={@on_cancel}
      class="relative z-10 hidden"
      aria-labelledby="modal-title"
      role="dialog"
      aria-modal="true"
    >
      <div
        class="fixed inset-0 bg-gray-500/75 transition-opacity"
        aria-hidden="true"
        phx-click={JS.exec("data-cancel", to: "##{@id}")}
      >
      </div>

      <div class="fixed inset-0 z-10 w-screen overflow-y-auto">
        <div class="flex min-h-full items-end justify-center p-4 text-center sm:items-center sm:p-0">
          <div class="relative transform overflow-hidden rounded-lg bg-white text-left shadow-xl transition-all sm:my-8 sm:w-full sm:max-w-lg">
            <div class="absolute right-0 top-0 pr-4 pt-4">
              <button
                type="button"
                class="rounded-md bg-white text-gray-400 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2"
                phx-click={JS.exec("data-cancel", to: "##{@id}")}
              >
                <span class="sr-only">Close</span>
                <svg
                  class="h-6 w-6"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                  aria-hidden="true"
                >
                  <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                </svg>
              </button>
            </div>
            <div class="bg-white px-4 pb-4 pt-5 sm:p-6 sm:pb-4">
              <%= if @title != [] do %>
                <h3 class="text-lg font-medium leading-6 text-gray-900" id="modal-title">
                  <%= render_slot(@title) %>
                </h3>
              <% end %>
              <div class="mt-2 text-sm text-gray-500">
                <%= render_slot(@inner_block) %>
              </div>
            </div>
            <%= if @footer != [] do %>
              <div class="bg-gray-50 px-4 py-3 sm:flex sm:flex-row-reverse sm:gap-2 sm:px-6">
                <%= render_slot(@footer) %>
              </div>
            <% end %>
          </div>
        </div>
      </div>
    </div>
    """
  end

  def show_modal(js_or_id, id \\ nil)
  def show_modal(%JS{} = js, id), do: do_show_modal(js, id)
  def show_modal(id, %JS{} = js), do: do_show_modal(js, id)
  def show_modal(id, nil) when is_binary(id), do: do_show_modal(%JS{}, id)

  defp do_show_modal(js, id) do
    js
    |> JS.show(to: "##{id}")
    |> JS.show(
      to: "##{id} .bg-gray-500\\/75",
      transition: {"transition-opacity ease-out duration-300", "opacity-0", "opacity-100"}
    )
    |> JS.show(
      to: "##{id} .transform",
      transition:
        {"transition-all ease-out duration-300",
         "opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95",
         "opacity-100 translate-y-0 sm:scale-100"}
    )
    |> JS.focus_first(to: "##{id} .transform")
  end

  def hide_modal(js_or_id, id \\ nil)
  def hide_modal(%JS{} = js, id), do: do_hide_modal(js, id)
  def hide_modal(id, %JS{} = js), do: do_hide_modal(js, id)
  def hide_modal(id, nil) when is_binary(id), do: do_hide_modal(%JS{}, id)

  defp do_hide_modal(js, id) do
    js
    |> JS.hide(
      to: "##{id} .bg-gray-500\\/75",
      transition: {"transition-opacity ease-in duration-200", "opacity-100", "opacity-0"}
    )
    |> JS.hide(
      to: "##{id} .transform",
      transition:
        {"transition-all ease-in duration-200", "opacity-100 translate-y-0 sm:scale-100",
         "opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"}
    )
    |> JS.hide(to: "##{id}")
    |> JS.pop_focus()
  end
end

defmodule HyperUI.Components.Ecommerce do
  @moduledoc """
  E-commerce components from HyperUI.
  Includes product cards, carts, and more.
  """
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  @doc """
  Renders a cart slide-over component.
  """
  attr :show, :boolean, default: false
  attr :id, :string, required: true
  attr :on_close, Phoenix.LiveView.JS
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true
  slot :footer

  @spec cart(map()) :: Phoenix.LiveView.Rendered.t()
  def cart(assigns) do
    assigns =
      assign_new(assigns, :on_close, fn ->
        hide_cart(assigns.id)
      end)

    ~H"""
    <div
      id={@id}
      phx-mounted={@show && show_cart(@id)}
      phx-remove={hide_cart(@id)}
      data-close={@on_close}
      class={["relative z-10 hidden", @class]}
      role="dialog"
      aria-modal="true"
      {@rest}
    >
      <div
        class="fixed inset-0 bg-gray-500/75 transition-opacity"
        phx-click={JS.exec("data-close", to: "##{@id}")}
      >
      </div>

      <div class="fixed inset-0 overflow-hidden">
        <div class="absolute inset-0 overflow-hidden">
          <div class="pointer-events-none fixed inset-y-0 right-0 flex max-w-full pl-10">
            <div class="pointer-events-auto w-screen max-w-md transform transition-all duration-500">
              <div class="flex h-full flex-col overflow-y-scroll bg-white shadow-xl">
                <div class="flex-1 overflow-y-auto px-4 py-6 sm:px-6">
                  <div class="flex items-start justify-between">
                    <h2 class="text-lg font-medium text-gray-900">Shopping Cart</h2>
                    <button
                      type="button"
                      class="ml-3 flex h-7 items-center text-gray-400 hover:text-gray-500"
                      phx-click={JS.exec("data-close", to: "##{@id}")}
                    >
                      <span class="sr-only">Close panel</span>
                      <svg class="size-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                      </svg>
                    </button>
                  </div>

                  <div class="mt-8">
                    <ul role="list" class="-my-6 divide-y divide-gray-200">
                      <%= render_slot(@inner_block) %>
                    </ul>
                  </div>
                </div>

                <%= if @footer != [] do %>
                  <div class="border-t border-gray-200 px-4 py-6 sm:px-6">
                    <%= render_slot(@footer) %>
                  </div>
                <% end %>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end

  def show_cart(js_or_id, id \\ nil)
  def show_cart(%JS{} = js, id), do: do_show_cart(js, id)
  def show_cart(id, %JS{} = js), do: do_show_cart(js, id)
  def show_cart(id, nil) when is_binary(id), do: do_show_cart(%JS{}, id)

  defp do_show_cart(js, id) do
    js
    |> JS.show(to: "##{id}")
    |> JS.show(
      to: "##{id} .bg-gray-500\\/75",
      transition: {"transition-opacity ease-out duration-500", "opacity-0", "opacity-100"}
    )
    |> JS.show(
      to: "##{id} .pointer-events-auto",
      transition:
        {"transition-transform ease-out duration-500", "translate-x-full", "translate-x-0"}
    )
  end

  def hide_cart(js_or_id, id \\ nil)
  def hide_cart(%JS{} = js, id), do: do_hide_cart(js, id)
  def hide_cart(id, %JS{} = js), do: do_hide_cart(js, id)
  def hide_cart(id, nil) when is_binary(id), do: do_hide_cart(%JS{}, id)

  defp do_hide_cart(js, id) do
    js
    |> JS.hide(
      to: "##{id} .bg-gray-500\\/75",
      transition: {"transition-opacity ease-in duration-500", "opacity-100", "opacity-0"}
    )
    |> JS.hide(
      to: "##{id} .pointer-events-auto",
      transition:
        {"transition-transform ease-in duration-500", "translate-x-0", "translate-x-full"}
    )
    |> JS.hide(to: "##{id}")
  end

  @doc """
  Renders a collection card.
  """
  attr :title, :string, required: true
  attr :image_url, :string, required: true
  attr :hover_image_url, :string, default: nil
  attr :price, :string, default: nil
  attr :url, :string, default: "#"
  attr :meta, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global

  @spec collection_card(map()) :: Phoenix.LiveView.Rendered.t()
  def collection_card(assigns) do
    ~H"""
    <a href={@url} class={["group block overflow-hidden", @class]} {@rest}>
      <div class="relative h-[350px] sm:h-[450px]">
        <img
          src={@image_url}
          alt={@title}
          class={["absolute inset-0 h-full w-full object-cover opacity-100", @hover_image_url && "group-hover:opacity-0"]}
        />

        <%= if @hover_image_url do %>
          <img
            src={@hover_image_url}
            alt={@title}
            class="absolute inset-0 h-full w-full object-cover opacity-0 group-hover:opacity-100"
          />
        <% end %>
      </div>

      <div class="relative bg-white pt-3">
        <h3 class="text-sm text-gray-700 group-hover:underline group-hover:underline-offset-4">
          <%= @title %>
        </h3>

        <div class="mt-1.5 flex items-center justify-between text-gray-900">
          <p class="tracking-wide"><%= @price %></p>
          <%= if @meta do %>
            <p class="text-xs uppercase tracking-wide"><%= @meta %></p>
          <% end %>
        </div>
      </div>
    </a>
    """
  end

  @doc """
  Renders a product review.
  """
  attr :author_name, :string, required: true
  attr :title, :string, default: nil
  attr :stars, :integer, default: 5
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  @spec product_review(map()) :: Phoenix.LiveView.Rendered.t()
  def product_review(assigns) do
    ~H"""
    <blockquote class={["rounded-lg bg-gray-50 p-6 shadow-sm sm:p-8", @class]} {@rest}>
      <div class="flex items-center gap-0.5 text-green-500">
        <%= for _ <- 1..@stars do %>
          <svg class="size-5" fill="currentColor" viewBox="0 0 20 20">
            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
          </svg>
        <% end %>
      </div>

      <div class="mt-4">
        <%= if @title do %>
          <p class="text-2xl font-bold text-black sm:text-3xl"><%= @title %></p>
        <% end %>
        <p class="mt-4 leading-relaxed text-gray-700">
          <%= render_slot(@inner_block) %>
        </p>
      </div>

      <footer class="mt-4 text-sm font-medium text-gray-700 sm:mt-6">
        &mdash; <%= @author_name %>
      </footer>
    </blockquote>
    """
  end

  @doc """
  Renders a variant selector (e.g., size, color).
  """
  attr :id, :string, required: true
  attr :name, :string, required: true
  attr :label, :string, default: nil
  attr :type, :string, default: "button", values: ~w(button swatch)
  attr :class, :string, default: nil
  attr :rest, :global

  slot :option, required: true do
    attr :value, :string, required: true
    attr :label, :string
    attr :color_class, :string
    attr :checked, :boolean
  end

  @spec variant_selector(map()) :: Phoenix.LiveView.Rendered.t()
  def variant_selector(assigns) do
    ~H"""
    <div class={@class}>
      <%= if @label do %>
        <p class="text-sm font-medium text-gray-900"><%= @label %></p>
      <% end %>

      <div class="mt-4 flex flex-wrap gap-2">
        <%= for option <- @option do %>
          <label for={"#{@id}_#{option.value}"} class="cursor-pointer">
            <input
              type="radio"
              name={@name}
              id={"#{@id}_#{option.value}"}
              value={option.value}
              class="peer sr-only"
              checked={Map.get(option, :checked, false)}
              {@rest}
            />

            <%= if @type == "button" do %>
              <span class="group inline-flex h-8 w-8 items-center justify-center rounded-full border text-xs font-medium peer-checked:bg-black peer-checked:text-white transition">
                <%= option[:label] || option.value %>
              </span>
            <% else %>
              <span class={[
                "block h-6 w-6 rounded-full border border-gray-200 ring-offset-2 peer-checked:ring-2 peer-checked:ring-black transition",
                option[:color_class] || "bg-gray-200"
              ]}>
              </span>
            <% end %>
          </label>
        <% end %>
      </div>
    </div>
    """
  end

  @doc """
  Renders a product card.

  ## Examples

  ### Basic Usage
  ```heex
  <.product_card
    image="https://images.unsplash.com/photo-1523275335684-37898b6baf30"
    title="Premium Watch"
    price="$199.00"
    url="#"
  />
  ```
  """
  attr :title, :string, required: true
  attr :price, :string, required: true
  attr :image, :string, required: true
  attr :url, :string, required: true
  attr :badge, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global

  @spec product_card(map()) :: Phoenix.LiveView.Rendered.t()
  def product_card(assigns) do
    ~H"""
    <a href={@url} class={["group block overflow-hidden", @class]} {@rest}>
      <img
        src={@image}
        alt={@title}
        class="h-[350px] w-full object-cover transition duration-500 group-hover:scale-105 sm:h-[450px]"
      />

      <div class="relative bg-white pt-3">
        <h3 class="text-xs text-gray-700 group-hover:underline group-hover:underline-offset-4">
          <%= @title %>
        </h3>

        <div class="mt-2 flex items-center justify-between">
          <p class="tracking-wider text-gray-900">
            <%= @price %>
          </p>

          <%= if @badge do %>
            <span class="rounded-full bg-gray-100 px-2.5 py-0.5 text-xs text-gray-600">
              <%= @badge %>
            </span>
          <% end %>
        </div>
      </div>
    </a>
    """
  end

  @doc """
  Renders a product collection grid with header and sorting.
  """
  attr :title, :string, required: true
  attr :subtitle, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  @spec product_collection(map()) :: Phoenix.LiveView.Rendered.t()
  def product_collection(assigns) do
    ~H"""
    <section class={["py-8 sm:py-12", @class]} {@rest}>
      <div class="mx-auto max-w-screen-xl px-4 lg:px-8">
        <header>
          <h2 class="text-xl font-bold text-gray-900 sm:text-3xl">
            <%= @title %>
          </h2>

          <%= if @subtitle do %>
            <p class="mt-4 max-w-md text-gray-500">
              <%= @subtitle %>
            </p>
          <% end %>
        </header>

        <div class="mt-8 flex items-center justify-between">
          <div class="flex rounded border border-gray-100">
            <button class="inline-flex size-10 items-center justify-center border-e text-gray-600 transition hover:bg-gray-50 hover:text-gray-700">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-5"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25A2.25 2.25 0 0113.5 18v-2.25z"
                />
              </svg>
            </button>

            <button class="inline-flex size-10 items-center justify-center text-gray-600 transition hover:bg-gray-50 hover:text-gray-700">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-5"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M3.75 5.25h16.5m-16.5 4.5h16.5m-16.5 4.5h16.5m-16.5 4.5h16.5"
                />
              </svg>
            </button>
          </div>

          <div>
            <label for="SortBy" class="sr-only">SortBy</label>

            <select id="SortBy" class="h-10 rounded border-gray-300 text-sm">
              <option>Sort By</option>
              <option value="Title, DESC">Title, DESC</option>
              <option value="Title, ASC">Title, ASC</option>
              <option value="Price, DESC">Price, DESC</option>
              <option value="Price, ASC">Price, ASC</option>
            </select>
          </div>
        </div>

        <ul class="mt-4 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          <%= render_slot(@inner_block) %>
        </ul>
      </div>
    </section>
    """
  end

  @doc """
  Renders a quantity input component.
  """
  attr :id, :string, required: true
  attr :name, :string, required: true
  attr :value, :integer, default: 1
  attr :class, :string, default: nil
  attr :rest, :global

  @spec quantity_input(map()) :: Phoenix.LiveView.Rendered.t()
  def quantity_input(assigns) do
    ~H"""
    <div class={@class} {@rest}>
      <label for={@id} class="sr-only">Quantity</label>

      <div class="flex items-center rounded border border-gray-200">
        <button
          type="button"
          class="size-10 leading-10 text-gray-600 transition hover:opacity-75"
        >
          &minus;
        </button>

        <input
          type="number"
          id={@id}
          name={@name}
          value={@value}
          class="h-10 w-16 border-y-0 border-x border-gray-200 text-center [-moz-appearance:_textfield] sm:text-sm [&::-webkit-inner-spin-button]:m-0 [&::-webkit-inner-spin-button]:appearance-none [&::-webkit-outer-spin-button]:m-0 [&::-webkit-outer-spin-button]:appearance-none"
        />

        <button
          type="button"
          class="size-10 leading-10 text-gray-600 transition hover:opacity-75"
        >
          &plus;
        </button>
      </div>
    </div>
    """
  end
end

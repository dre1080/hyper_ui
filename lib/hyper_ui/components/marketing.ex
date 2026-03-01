defmodule HyperUI.Components.Marketing do
  @moduledoc """
  Marketing components from HyperUI.
  Includes heroes, navbars, FAQs, and more.
  """
  use Phoenix.Component

  @doc """
  Renders a simple FAQ section.

  ## Examples

  ### Basic Usage
  ```heex
  <.faq title="Frequently Asked Questions">
    <:item question="What is HyperUI?">
      It is a collection of open-source Tailwind CSS components.
    </:item>
  </.faq>
  ```
  """
  attr :title, :string, default: "Frequently Asked Questions"
  attr :class, :string, default: nil
  attr :rest, :global

  slot :item, required: true do
    attr :question, :string, required: true
  end

  @spec faq(map()) :: Phoenix.LiveView.Rendered.t()
  def faq(assigns) do
    ~H"""
    <div class={["space-y-4", @class]} {@rest}>
      <%= if @title do %>
        <h2 class="text-2xl font-bold text-gray-900 sm:text-3xl">
          <%= @title %>
        </h2>
      <% end %>

      <%= for item <- @item do %>
        <details class="group [&_summary::-webkit-details-marker]:hidden" open={Map.get(item, :open, false)}>
          <summary class="flex cursor-pointer items-center justify-between gap-1.5 rounded-lg bg-gray-50 p-4 text-gray-900">
            <h2 class="font-medium">
              <%= item.question %>
            </h2>

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

          <p class="mt-4 px-4 leading-relaxed text-gray-700">
            <%= render_slot(item) %>
          </p>
        </details>
      <% end %>
    </div>
    """
  end

  @doc """
  Renders a basic Hero section.

  ## Examples

  ### Split with Image
  ```heex
  <.hero
    title="Understand User Flow"
    subtitle="Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    image_url="https://images.unsplash.com/photo-1464582883107-8adf2dcd87d6"
    variant="split"
  >
    <.button color="emerald">Get Started Today</.button>
  </.hero>
  ```
  """
  attr :title, :string, required: true
  attr :subtitle, :string, default: nil
  attr :image_url, :string, default: nil
  attr :variant, :string, default: "split", values: ~w(split centered background)
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block

  @spec hero(map()) :: Phoenix.LiveView.Rendered.t()
  def hero(assigns) do
    case assigns.variant do
      "split" -> hero_split(assigns)
      "centered" -> hero_centered(assigns)
      "background" -> hero_background(assigns)
      _ -> hero_split(assigns)
    end
  end

  defp hero_split(assigns) do
    ~H"""
    <section class={["overflow-hidden bg-gray-50 sm:grid sm:grid-cols-2", @class]} {@rest}>
      <div class="p-8 md:p-12 lg:px-16 lg:py-24">
        <div class="mx-auto max-w-xl text-center ltr:sm:text-left rtl:sm:text-right">
          <h2 class="text-2xl font-bold text-gray-900 md:text-3xl">
            <%= @title %>
          </h2>

          <%= if @subtitle do %>
            <p class="hidden text-gray-500 md:mt-4 md:block">
              <%= @subtitle %>
            </p>
          <% end %>

          <div class="mt-4 md:mt-8 flex flex-wrap gap-4 justify-center sm:justify-start">
            <%= render_slot(@inner_block) %>
          </div>
        </div>
      </div>

      <%= if @image_url do %>
        <img alt="" src={@image_url} class="h-56 w-full object-cover sm:h-full" />
      <% end %>
    </section>
    """
  end

  defp hero_centered(assigns) do
    ~H"""
    <section class={["bg-gray-50", @class]} {@rest}>
      <div class="mx-auto max-w-screen-xl px-4 py-32 lg:flex lg:h-screen lg:items-center">
        <div class="mx-auto max-w-xl text-center">
          <h1 class="text-3xl font-extrabold sm:text-5xl">
            <%= @title %>
          </h1>

          <%= if @subtitle do %>
            <p class="mt-4 sm:text-xl/relaxed text-gray-600">
              <%= @subtitle %>
            </p>
          <% end %>

          <div class="mt-8 flex flex-wrap justify-center gap-4">
            <%= render_slot(@inner_block) %>
          </div>
        </div>
      </div>
    </section>
    """
  end

  defp hero_background(assigns) do
    ~H"""
    <section
      class={[
        "relative bg-cover bg-center bg-no-repeat",
        @class
      ]}
      style={@image_url && "background-image: url(#{@image_url});"}
      {@rest}
    >
      <div class="absolute inset-0 bg-gray-900/75 sm:bg-transparent sm:from-gray-900/95 sm:to-gray-900/25 ltr:sm:bg-gradient-to-r rtl:sm:bg-gradient-to-l">
      </div>

      <div class="relative mx-auto max-w-screen-xl px-4 py-32 sm:px-6 lg:flex lg:h-screen lg:items-center lg:px-8">
        <div class="max-w-xl text-center ltr:sm:text-left rtl:sm:text-right">
          <h1 class="text-3xl font-extrabold text-white sm:text-5xl">
            <%= @title %>
          </h1>

          <%= if @subtitle do %>
            <p class="mt-4 max-w-lg text-white sm:text-xl/relaxed">
              <%= @subtitle %>
            </p>
          <% end %>

          <div class="mt-8 flex flex-wrap gap-4 text-center justify-center sm:justify-start">
            <%= render_slot(@inner_block) %>
          </div>
        </div>
      </div>
    </section>
    """
  end

  @doc """
  Renders a pricing section.
  """
  attr :class, :string, default: nil
  attr :rest, :global

  slot :plan, required: true do
    attr :name, :string, required: true
    attr :description, :string
    attr :price, :string, required: true
    attr :period, :string
    attr :highlight, :boolean
    attr :button_text, :string
    attr :button_url, :string
  end

  @spec pricing(map()) :: Phoenix.LiveView.Rendered.t()
  def pricing(assigns) do
    ~H"""
    <div class={["grid grid-cols-1 gap-4 sm:grid-cols-2 sm:items-stretch md:grid-cols-3 md:gap-8", @class]} {@rest}>
      <%= for plan <- @plan do %>
        <div class={[
          "divide-y divide-gray-200 rounded-2xl border shadow-sm",
          if(Map.get(plan, :highlight, false), do: "border-black ring-1 ring-black", else: "border-gray-200")
        ]}>
          <div class="p-6 sm:px-8">
            <h2 class="text-lg font-medium text-gray-900">
              <%= plan.name %>
              <span class="sr-only">Plan</span>
            </h2>

            <p class="mt-2 text-gray-700"><%= plan[:description] %></p>

            <p class="mt-2 sm:mt-4">
              <strong class="text-3xl font-bold text-gray-900 sm:text-4xl"> <%= plan.price %> </strong>
              <span class="text-sm font-medium text-gray-700"><%= Map.get(plan, :period, "/month") %></span>
            </p>

            <a
              class="mt-4 block rounded border border-black bg-black px-12 py-3 text-center text-sm font-medium text-white hover:bg-transparent hover:text-black focus:outline-none focus:ring active:text-black sm:mt-6"
              href={Map.get(plan, :button_url, "#")}
            >
              <%= Map.get(plan, :button_text, "Get Started") %>
            </a>
          </div>

          <div class="p-6 sm:px-8">
            <p class="text-lg font-medium text-gray-900 sm:text-xl">What's included:</p>

            <ul class="mt-2 space-y-2 sm:mt-4">
              <%= render_slot(plan) %>
            </ul>
          </div>
        </div>
      <% end %>
    </div>
    """
  end

  @doc """
  Renders a stats section.
  """
  attr :title, :string, default: nil
  attr :subtitle, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global

  slot :stat, required: true do
    attr :label, :string, required: true
    attr :value, :string, required: true
  end

  @spec stats(map()) :: Phoenix.LiveView.Rendered.t()
  def stats(assigns) do
    ~H"""
    <section class={["bg-white", @class]} {@rest}>
      <div class="mx-auto max-w-screen-xl px-4 py-12 sm:px-6 md:py-16 lg:px-8">
        <%= if @title || @subtitle do %>
          <div class="mx-auto max-w-3xl text-center">
            <%= if @title do %>
              <h2 class="text-3xl font-bold text-gray-900 sm:text-4xl"><%= @title %></h2>
            <% end %>
            <%= if @subtitle do %>
              <p class="mt-4 text-gray-500 sm:text-xl">
                <%= @subtitle %>
              </p>
            <% end %>
          </div>
        <% end %>

        <div class="mt-8 sm:mt-12">
          <dl class="grid grid-cols-1 gap-4 sm:grid-cols-3">
            <%= for stat <- @stat do %>
              <div class="flex flex-col rounded-lg border border-gray-100 px-4 py-8 text-center">
                <dt class="order-last text-lg font-medium text-gray-500"><%= stat.label %></dt>
                <dd class="text-4xl font-extrabold text-black md:text-5xl"><%= stat.value %></dd>
              </div>
            <% end %>
          </dl>
        </div>
      </div>
    </section>
    """
  end

  @doc """
  Renders a CTA section.
  """
  attr :title, :string, required: true
  attr :subtitle, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block

  @spec cta(map()) :: Phoenix.LiveView.Rendered.t()
  def cta(assigns) do
    ~H"""
    <section class={["overflow-hidden bg-gray-50 sm:grid sm:grid-cols-2", @class]} {@rest}>
      <div class="p-8 md:p-12 lg:px-16 lg:py-24">
        <div class="mx-auto max-w-xl text-center ltr:sm:text-left rtl:sm:text-right">
          <h2 class="text-2xl font-bold text-gray-900 md:text-3xl">
            <%= @title %>
          </h2>

          <%= if @subtitle do %>
            <p class="hidden text-gray-500 md:mt-4 md:block">
              <%= @subtitle %>
            </p>
          <% end %>

          <div class="mt-4 md:mt-8">
            <%= render_slot(@inner_block) %>
          </div>
        </div>
      </div>

      <img
        alt=""
        src="https://images.unsplash.com/photo-1484959014842-cd1d967a39cf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80"
        class="h-56 w-full object-cover sm:h-full"
      />
    </section>
    """
  end

  @doc """
  Renders a newsletter CTA component.
  """
  attr :title, :string, required: true
  attr :subtitle, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block

  @spec newsletter_cta(map()) :: Phoenix.LiveView.Rendered.t()
  def newsletter_cta(assigns) do
    ~H"""
    <section class={["bg-gray-50", @class]} {@rest}>
      <div class="p-8 md:p-12 lg:px-16 lg:py-24">
        <div class="mx-auto max-w-lg text-center">
          <h2 class="text-2xl font-bold text-gray-900 md:text-3xl">
            <%= @title %>
          </h2>

          <%= if @subtitle do %>
            <p class="hidden text-gray-500 sm:mt-4 sm:block">
              <%= @subtitle %>
            </p>
          <% end %>
        </div>

        <div class="mx-auto mt-8 max-w-xl">
          <%= render_slot(@inner_block) %>
        </div>
      </div>
    </section>
    """
  end

  @doc """
  Renders a navbar component.
  """
  attr :class, :string, default: nil
  attr :rest, :global
  slot :brand, required: true

  slot :item do
    attr :url, :string, required: true
  end

  slot :action

  @spec navbar(map()) :: Phoenix.LiveView.Rendered.t()
  def navbar(assigns) do
    ~H"""
    <header class={["bg-white", @class]} {@rest}>
      <div class="mx-auto max-w-screen-xl px-4 sm:px-6 lg:px-8">
        <div class="flex h-16 items-center justify-between">
          <div class="md:flex md:items-center md:gap-12">
            <a class="block text-teal-600" href="/">
              <%= render_slot(@brand) %>
            </a>
          </div>

          <div class="hidden md:block">
            <nav aria-label="Global">
              <ul class="flex items-center gap-6 text-sm">
                <%= for item <- @item do %>
                  <li>
                    <a class="text-gray-500 transition hover:text-gray-500/75" href={item.url}>
                      <%= render_slot(item) %>
                    </a>
                  </li>
                <% end %>
              </ul>
            </nav>
          </div>

          <div class="flex items-center gap-4">
            <div class="sm:flex sm:gap-4">
              <%= render_slot(@action) %>
            </div>

            <div class="block md:hidden">
              <button class="rounded-sm bg-gray-100 p-2 text-gray-600 transition hover:text-gray-600/75">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  class="size-5"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                  stroke-width="2"
                >
                  <path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16M4 18h16" />
                </svg>
              </button>
            </div>
          </div>
        </div>
      </div>
    </header>
    """
  end

  @doc """
  Renders an announcement component.
  """
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  @spec announcement(map()) :: Phoenix.LiveView.Rendered.t()
  def announcement(assigns) do
    ~H"""
    <div class={["bg-black px-4 py-3 text-white", @class]} {@rest}>
      <p class="text-center text-sm font-medium">
        <%= render_slot(@inner_block) %>
      </p>
    </div>
    """
  end

  @doc """
  Renders a footer component.
  """
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block

  @spec footer(map()) :: Phoenix.LiveView.Rendered.t()
  def footer(assigns) do
    ~H"""
    <footer class={["bg-gray-50", @class]} {@rest}>
      <div class="mx-auto max-w-screen-xl px-4 py-8 sm:px-6 lg:px-8">
        <div class="sm:flex sm:items-center sm:justify-between">
          <div class="flex justify-center text-teal-600 sm:justify-start">
            <span class="text-2xl font-bold">HyperUI</span>
          </div>

          <p class="mt-4 text-center text-sm text-gray-500 lg:mt-0 lg:text-right">
            Copyright &copy; <%= DateTime.utc_now().year %>. All rights reserved.
          </p>
        </div>
        <%= if @inner_block != [] do %>
          <div class="mt-8 border-t border-gray-100 pt-8">
            <%= render_slot(@inner_block) %>
          </div>
        <% end %>
      </div>
    </footer>
    """
  end

  @doc """
  Renders a blog card component.
  """
  attr :title, :string, required: true
  attr :description, :string, default: nil
  attr :image_url, :string, default: nil
  attr :date, :string, default: nil
  attr :url, :string, default: "#"
  attr :class, :string, default: nil
  attr :rest, :global

  @spec blog_card(map()) :: Phoenix.LiveView.Rendered.t()
  def blog_card(assigns) do
    ~H"""
    <article class={["overflow-hidden rounded-lg shadow transition hover:shadow-lg", @class]} {@rest}>
      <%= if @image_url do %>
        <img alt={@title} src={@image_url} class="h-56 w-full object-cover" />
      <% end %>

      <div class="bg-white p-4 sm:p-6">
        <%= if @date do %>
          <time datetime={@date} class="block text-xs text-gray-500"> <%= @date %> </time>
        <% end %>

        <a href={@url}>
          <h3 class="mt-0.5 text-lg text-gray-900 font-medium"> <%= @title %> </h3>
        </a>

        <%= if @description do %>
          <p class="mt-2 line-clamp-3 text-sm/relaxed text-gray-500">
            <%= @description %>
          </p>
        <% end %>
      </div>
    </article>
    """
  end

  @doc """
  Renders a testimonials section.
  """
  attr :title, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global

  slot :testimonial, required: true do
    attr :author_name, :string, required: true
    attr :author_role, :string
    attr :author_image, :string
    attr :stars, :integer
  end

  @spec testimonials(map()) :: Phoenix.LiveView.Rendered.t()
  def testimonials(assigns) do
    ~H"""
    <section class={["bg-white", @class]} {@rest}>
      <div class="mx-auto max-w-screen-xl px-4 py-12 sm:px-6 lg:px-8 lg:py-16">
        <%= if @title do %>
          <h2 class="text-center text-4xl font-bold tracking-tight text-gray-900 sm:text-5xl">
            <%= @title %>
          </h2>
        <% end %>

        <div class="mt-8 grid grid-cols-1 gap-4 md:grid-cols-3 md:gap-8">
          <%= for testimonial <- @testimonial do %>
            <blockquote class="rounded-lg bg-gray-50 p-6 shadow-sm sm:p-8">
              <div class="flex items-center gap-4">
                <%= if testimonial[:author_image] do %>
                  <img alt={testimonial.author_name} src={testimonial.author_image} class="size-14 rounded-full object-cover" />
                <% end %>

                <div>
                  <div class="flex justify-center gap-0.5 text-green-500">
                    <%= for _ <- 1..Map.get(testimonial, :stars, 5) do %>
                      <svg xmlns="http://www.w3.org/2000/svg" class="size-5" viewBox="0 0 20 20" fill="currentColor">
                        <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                      </svg>
                    <% end %>
                  </div>

                  <p class="mt-0.5 text-lg font-medium text-gray-900"><%= testimonial.author_name %></p>
                  <%= if testimonial[:author_role] do %>
                    <p class="text-sm text-gray-500"><%= testimonial.author_role %></p>
                  <% end %>
                </div>
              </div>

              <p class="mt-4 text-gray-700">
                <%= render_slot(testimonial) %>
              </p>
            </blockquote>
          <% end %>
        </div>
      </div>
    </section>
    """
  end
end

defmodule HyperUI.Storybook.Welcome do
  use PhoenixStorybook.Story, :page

  def doc, do: "Welcome to HyperUI Elixir Component Library"

  def navigation do
    [
      {:welcome, "Introduction", {:hero, "home"}},
      {:installation, "Installation", {:hero, "arrow_down_tray"}},
      {:configuration, "Tailwind Configuration", {:hero, "cog"}}
    ]
  end

  def render(assigns = %{tab: :welcome}) do
    ~H"""
    <div class="space-y-8 max-w-4xl">
      <div class="space-y-4">
        <h1 class="text-4xl font-extrabold tracking-tight text-black sm:text-5xl">
          HyperUI <span class="text-neutral-600">for Elixir</span>
        </h1>
        <p class="text-xl text-neutral-600 leading-relaxed">
          A comprehensive Phoenix LiveView component library based on the beautiful Tailwind CSS components from <a href="https://www.hyperui.dev" target="_blank" class="text-black underline decoration-2 underline-offset-4 font-bold">HyperUI</a>.
        </p>
      </div>

      <div class="mt-12 p-8 bg-neutral-100 rounded-3xl border border-neutral-200">
        <h2 class="text-2xl font-bold text-black">Get Started</h2>
        <p class="mt-4 text-neutral-700">Explore the components in the sidebar to see variants, check documentation, and play with attributes in the playground.</p>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-12">
        <div class="p-6 border border-neutral-200 rounded-2xl bg-white shadow-sm hover:shadow-md transition">
          <h3 class="text-lg font-bold text-black">Application UI</h3>
          <p class="mt-2 text-neutral-600">Core primitives for building functional dashboards: Tables, Forms, Navigation, and more.</p>
        </div>
        <div class="p-6 border border-neutral-200 rounded-2xl bg-white shadow-sm hover:shadow-md transition">
          <h3 class="text-lg font-bold text-black">Marketing</h3>
          <p class="mt-2 text-neutral-600">Beautiful page blocks to convert users: Heroes, Testimonials, Pricing, and CTAs.</p>
        </div>
        <div class="p-6 border border-neutral-200 rounded-2xl bg-white shadow-sm hover:shadow-md transition">
          <h3 class="text-lg font-bold text-black">Ecommerce</h3>
          <p class="mt-2 text-neutral-600">Complete toolkit for online stores: Product Cards, Carts, and Filter sidebars.</p>
        </div>
        <div class="p-6 border-2 border-black rounded-xl shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] hover:translate-x-[2px] hover:translate-y-[2px] hover:shadow-none transition-all">
          <h3 class="text-lg font-black text-black">Neo-Brutalism</h3>
          <p class="mt-2 text-black font-medium">A bold, high-contrast theme with thick borders and hard shadows for modern projects.</p>
        </div>
      </div>
    </div>
    """
  end

  def render(assigns = %{tab: :installation}) do
    ~H"""
    <div class="space-y-6 max-w-4xl">
      <h2 class="text-3xl font-bold text-black">Installation</h2>
      <p class="text-neutral-600">Add <code class="bg-neutral-100 px-1 rounded text-black font-mono">hyper_ui</code> to your <code class="bg-neutral-100 px-1 rounded text-black font-mono">mix.exs</code> dependencies:</p>
      <pre class="p-4 bg-black text-white rounded-lg overflow-x-auto font-mono text-sm"><code>def deps do
    [
      {"\{:hyper_ui, \"~> 0.2.0\"\}"}
    ]
    end</code></pre>
      <p class="text-neutral-600 mt-8">Then import the components in your web module or core components:</p>
      <pre class="p-4 bg-black text-white rounded-lg overflow-x-auto font-mono text-sm"><code>defmodule MyAppWeb.CoreComponents do
      use HyperUI
      # ...
    end</code></pre>
    </div>
    """
  end

  def render(assigns = %{tab: :configuration}) do
    ~H"""
    <div class="space-y-6 max-w-4xl">
      <h2 class="text-3xl font-bold text-black">Tailwind CSS v4 Configuration</h2>
      <p class="text-neutral-600">HyperUI is optimized for Tailwind CSS v4. Add the library's source files to your <code class="bg-neutral-100 px-1 rounded text-black font-mono">app.css</code> using the <code class="bg-neutral-100 px-1 rounded text-black font-mono">@source</code> directive:</p>

      <pre class="p-4 bg-black text-white rounded-lg overflow-x-auto font-mono text-sm"><code>@import "tailwindcss";

    /* Point to the dependency directory relative to your CSS file */
    @source "../../../deps/hyper_ui/**/*.*ex";</code></pre>

      <div class="p-4 bg-amber-50 border-l-4 border-amber-400 text-amber-700 mt-8">
        <p class="font-bold">Pro Tip</p>
        <p>Ensure your paths are correct. In a standard Phoenix project, <code class="bg-white/50 px-1">../../../deps</code> is usually correct when your CSS is in <code class="bg-white/50 px-1">assets/css/app.css</code>.</p>
      </div>
    </div>
    """
  end
end

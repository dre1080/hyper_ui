# HyperUI

A comprehensive Phoenix LiveView component library based on [HyperUI](https://www.hyperui.dev/) Tailwind CSS components.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `hyper_ui` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:hyper_ui, "~> 0.1.0"}
  ]
end
```

## Configuration

Tailwind CSS v4 uses a CSS-first configuration. You must add the library's source files directly in your `assets/css/app.css` (or wherever your main CSS entry point is) using the `@source` directive:

```css
@import "tailwindcss";

/* Point to the dependency directory relative to your CSS file */
@source "../../../deps/hyper_ui/**/*.*ex";
```

Alternatively, if you are not using the standard Phoenix directory structure, ensure the path points correctly to your `deps/hyper_ui` directory.

## Usage

You can use the components by importing `HyperUI` into your Web module or directly in your `CoreComponents`.

```elixir
defmodule MyAppWeb.CoreComponents do
  use Phoenix.Component
  
  # Import all HyperUI components
  use HyperUI
end
```

Then, you can use the components in your HEEx templates:

```elixir
<.button color="blue" variant="solid">Submit</.button>

<.badge color="green">Active</.badge>

<.alert kind="info" title="Information">
  Your settings have been updated successfully.
</.alert>
```

## Available Components

The library is organized into the following modules, all of which are imported when you `use HyperUI`:

- `HyperUI.Components.ApplicationUI`: Core primitives (Buttons, Badges, Alerts, etc.)
- `HyperUI.Components.ApplicationUI.Forms`: Form elements (Inputs, Toggles, etc.)
- `HyperUI.Components.Marketing`: Page blocks (Heroes, FAQs, etc.)
- `HyperUI.Components.Ecommerce`: E-commerce elements (Product Cards, etc.)

## Interactive Documentation (Storybook)

HyperUI comes with a [Phoenix Storybook](https://github.com/phenixdigital/phoenix_storybook) configuration. This allows you to explore and interact with components in your local development environment.

To use the storybook in your own application:

1. Add `phoenix_storybook` to your `mix.exs` dependencies.
2. Configure a Storybook backend and router in your application.
3. Reference the stories provided in `deps/hyper_ui/storybook`.

Alternatively, if you are contributing to this library, you can run the storybook directly:

```bash
mix phx.server
```

(Note: This requires a minimal Phoenix environment set up in the `dev` environment of the library).

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/hyper_ui>.

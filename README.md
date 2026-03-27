# HyperUI

[![Hex version](https://img.shields.io/hexpm/v/hyper_ui.svg "Hex version")](https://hex.pm/packages/hyper_ui)
[![CI](https://github.com/dre1080/hyper_ui/actions/workflows/ci.yml/badge.svg)](https://github.com/dre1080/hyper_ui/actions/workflows/ci.yml)

A comprehensive, production-grade Phoenix LiveView component library based on [HyperUI](https://www.hyperui.dev/) Tailwind CSS components.

HyperUI provides a set of highly customizable, accessible, and responsive components designed to accelerate your Phoenix LiveView development. It includes everything from core application primitives to full marketing blocks and e-commerce elements.

## Installation

The package can be installed by adding `hyper_ui` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:hyper_ui, "~> 0.1.0"}
  ]
end
```

## Configuration

### Tailwind CSS v4

Tailwind CSS v4 uses a CSS-first configuration. You must add the library's source files directly in your `assets/css/app.css` (or wherever your main CSS entry point is) using the `@source` directive:

```css
@import "tailwindcss";

/* Point to the dependency directory relative to your CSS file */
@source "../../../deps/hyper_ui/**/*.*ex";
```

### Usage

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

- `HyperUI.Components.ApplicationUI`: Core primitives (Buttons, Badges, Alerts, Tables, Modals, etc.)
- `HyperUI.Components.ApplicationUI.Forms`: Form elements (Inputs, Toggles, etc.)
- `HyperUI.Components.Marketing`: Page blocks (Heroes, FAQs, Footers, Navbars, Pricing, etc.)
- `HyperUI.Components.Ecommerce`: E-commerce elements (Product Cards, Carts, etc.)
- `HyperUI.Components.Neobrutalism`: Components with a Neobrutalist design aesthetic.

## Interactive Documentation (Storybook)

HyperUI includes a [Phoenix Storybook](https://github.com/phenixdigital/phoenix_storybook) configuration to explore and interact with components in your development environment.

To run the storybook directly from the library during development:

```bash
cd storybook
mix setup
mix phx.server
```

Then visit `http://localhost:4000/storybook`.

For detailed API documentation, visit [HexDocs](https://hexdocs.pm/hyper_ui).

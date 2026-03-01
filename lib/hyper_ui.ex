defmodule HyperUI do
  @moduledoc """
  A comprehensive library of Phoenix LiveView components styled with HyperUI Tailwind CSS classes.

  ## Usage

  To use the components in your application, you can either `import` or `use` this module.

  ```elixir
  defmodule MyAppWeb.CoreComponents do
    use HyperUI
  end
  ```

  This will make all components available to use in your HEEx templates.

  Make sure to add the library to your `assets/css/app.css` (or equivalent) using the `@source` directive:

  ```css
  @import "tailwindcss";

  /* ... your other sources */
  @source "../../../deps/hyper_ui/**/*.*ex";
  ```
  """

  defmacro __using__(_opts) do
    quote do
      import HyperUI.Components.ApplicationUI
      import HyperUI.Components.ApplicationUI.Forms
      import HyperUI.Components.Marketing
      import HyperUI.Components.Ecommerce
      import HyperUI.Components.Neobrutalism
    end
  end
end

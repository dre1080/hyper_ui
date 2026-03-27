# Used by "mix format" in the storybook project
[
  import_deps: [:phoenix, :phoenix_live_view, :phoenix_storybook],
  inputs: [
    "{mix,.formatter}.exs",
    "{config,lib,test}/**/*.{ex,exs}",
    "*.exs",
    "components/**/*.exs"
  ]
]

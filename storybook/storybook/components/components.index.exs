defmodule HyperUI.Storybook.Components.Index do
  use PhoenixStorybook.Index

  def folder_icon, do: {:hero, "squares_plus", :outline, "psb:mr-1"}
  def folder_name, do: "Components"

  def entry("application_ui") do
    [
      name: "Application UI",
      icon: {:hero, "window"}
    ]
  end

  def entry("marketing") do
    [
      name: "Marketing",
      icon: {:hero, "megaphone"}
    ]
  end

  def entry("ecommerce") do
    [
      name: "Ecommerce",
      icon: {:hero, "shopping_bag"}
    ]
  end

  def entry("neobrutalism") do
    [
      name: "Neo-Brutalism",
      icon: {:hero, "sparkles"}
    ]
  end
end

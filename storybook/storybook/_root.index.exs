defmodule HyperUI.Storybook.Root do
  use PhoenixStorybook.Index

  def folder_icon, do: {:hero, "book_open", :outline, "psb:mr-1"}
  def folder_name, do: "HyperUI"

  def entry("welcome") do
    [
      name: "Introduction",
      icon: {:hero, "home"}
    ]
  end

  def entry("components") do
    [
      name: "Components",
      icon: {:hero, "squares_plus"}
    ]
  end
end

defmodule HyperUI.Storybook.Table do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.ApplicationUI.table/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          rows: [
            %{name: "John Doe", role: "Web Developer", salary: "$120,000"},
            %{name: "Jane Doe", role: "Designer", salary: "$100,000"}
          ]
        },
        slots: [
          """
          <:col :let={user} label="Name"><%= user.name %></:col>
          <:col :let={user} label="Role"><%= user.role %></:col>
          <:col :let={user} label="Salary"><%= user.salary %></:col>
          """
        ]
      }
    ]
  end
end

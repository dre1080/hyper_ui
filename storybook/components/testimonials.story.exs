defmodule HyperUI.Storybook.Testimonials do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Marketing.testimonials/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          title: "Read trusted reviews from our customers"
        },
        slots: [
          """
          <:testimonial author_name="Paul Starr" author_image="https://images.unsplash.com/photo-1595152772835-219674b2a8a6?ixlib=rb-1.2.1&auto=format&fit=crop&w=1180&q=80">
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Culpa sit rerum incidunt, odit nisi ipsam delectus molestias acusamus quia officiis?
          </:testimonial>
          <:testimonial author_name="Gladis Lennon" author_role="Head of SEO" author_image="https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?auto=format&fit=crop&w=150&q=80">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime minima neque architecto nihil, dicta eveniet incidunt cumque error.
          </:testimonial>
          """
        ]
      }
    ]
  end
end

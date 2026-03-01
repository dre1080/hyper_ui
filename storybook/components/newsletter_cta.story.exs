defmodule HyperUI.Storybook.NewsletterCta do
  use PhoenixStorybook.Story, :component

  def function, do: &HyperUI.Components.Marketing.newsletter_cta/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          title: "Want the latest updates?",
          subtitle:
            "Join our newsletter to get the best curated content delivered straight to your inbox every week."
        },
        slots: [
          """
          <form action="#" class="sm:flex sm:gap-4">
            <div class="sm:flex-1">
              <label for="email" class="sr-only">Email</label>
              <input type="email" placeholder="Email address" class="w-full rounded-md border-gray-200 bg-white p-3 text-gray-700 shadow-sm transition focus:border-white focus:outline-none focus:ring focus:ring-yellow-400" />
            </div>
            <HyperUI.Components.ApplicationUI.button color="black" class="mt-4 sm:mt-0 sm:w-auto px-5 py-3">Sign Up</HyperUI.Components.ApplicationUI.button>
          </form>
          """
        ]
      }
    ]
  end
end

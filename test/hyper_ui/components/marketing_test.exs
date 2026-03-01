defmodule HyperUI.Components.MarketingTest do
  use ExUnit.Case, async: true
  import Phoenix.LiveViewTest
  import Phoenix.Component
  import HyperUI.Components.Marketing

  test "renders faq" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.faq title="Common Question">
        <:item question="How do I use this?">
          Just import the module.
        </:item>
      </.faq>
      """)

    assert html =~ "Common Question"
    assert html =~ "How do I use this?"
    assert html =~ "Just import the module."
  end

  test "renders hero" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.hero title="Main Header" subtitle="Subtitle here" />
      """)

    assert html =~ "Main Header"
    assert html =~ "Subtitle here"
  end

  test "renders pricing" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.pricing>
        <:plan name="Free Plan" price="$0" description="For beginners">
          <li>Basic support</li>
        </:plan>
      </.pricing>
      """)

    assert html =~ "Free Plan"
    assert html =~ "$0"
    assert html =~ "For beginners"
    assert html =~ "Basic support"
  end

  test "renders stats" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.stats title="Our Impact" subtitle="Check the numbers">
        <:stat label="Users" value="10k+" />
        <:stat label="Countries" value="50" />
      </.stats>
      """)

    assert html =~ "Our Impact"
    assert html =~ "Check the numbers"
    assert html =~ "Users"
    assert html =~ "10k+"
    assert html =~ "Countries"
    assert html =~ "50"
  end

  test "renders cta" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.cta title="Ready to start?">
        <button>Get Started</button>
      </.cta>
      """)

    assert html =~ "Ready to start?"
    assert html =~ "Get Started"
  end

  test "renders newsletter_cta" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.newsletter_cta title="Join our newsletter">
        <input type="email" placeholder="Email" />
      </.newsletter_cta>
      """)

    assert html =~ "Join our newsletter"
    assert html =~ "Email"
  end

  test "renders navbar" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.navbar>
        <:brand>LOGO</:brand>
        <:item url="/about">About</:item>
        <:item url="/contact">Contact</:item>
        <:action><button>Login</button></:action>
      </.navbar>
      """)

    assert html =~ "LOGO"
    assert html =~ "About"
    assert html =~ "Contact"
    assert html =~ "Login"
  end

  test "renders announcement" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.announcement>New feature released!</.announcement>
      """)

    assert html =~ "New feature released!"
    assert html =~ "bg-black"
  end

  test "renders footer" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.footer>
        Links here
      </.footer>
      """)

    assert html =~ "HyperUI"
    assert html =~ "Links here"
    assert html =~ "All rights reserved"
  end

  test "renders blog_card" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.blog_card
        title="Elixir is Awesome"
        description="Learn why Elixir is great for web dev."
        date="2026-03-01"
        url="/blog/elixir"
      />
      """)

    assert html =~ "Elixir is Awesome"
    assert html =~ "Learn why Elixir is great for web dev."
    assert html =~ "2026-03-01"
    assert html =~ "/blog/elixir"
  end

  test "renders testimonials" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.testimonials title="What they say">
        <:testimonial author_name="Jane Smith" author_role="CEO" stars={5}>
          Best product ever!
        </:testimonial>
      </.testimonials>
      """)

    assert html =~ "What they say"
    assert html =~ "Jane Smith"
    assert html =~ "CEO"
    assert html =~ "Best product ever!"
    assert length(Regex.scan(~r/<svg/, html)) == 5
  end
end

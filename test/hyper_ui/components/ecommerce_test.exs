defmodule HyperUI.Components.EcommerceTest do
  use ExUnit.Case, async: true
  import Phoenix.LiveViewTest
  import Phoenix.Component
  import HyperUI.Components.Ecommerce

  test "renders product_card" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.product_card
        title="Awesome Tee"
        price="$25"
        image="/tee.jpg"
        url="/products/tee"
      />
      """)

    assert html =~ "Awesome Tee"
    assert html =~ "$25"
    assert html =~ "/tee.jpg"
    assert html =~ "/products/tee"
  end

  test "renders cart" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.cart id="test_cart" show={true}>
        <li>Item in cart</li>
        <:footer>
          Cart Footer
        </:footer>
      </.cart>
      """)

    assert html =~ "Shopping Cart"
    assert html =~ "Item in cart"
    assert html =~ "Cart Footer"
  end

  test "renders collection_card" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.collection_card title="New Arrivals" image_url="/new.jpg" url="/new" />
      """)

    assert html =~ "New Arrivals"
    assert html =~ "/new.jpg"
    assert html =~ "/new"
  end

  test "renders product_review" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.product_review author_name="John Doe" title="Great stuff!" stars={4}>
        Very happy with the quality.
      </.product_review>
      """)

    assert html =~ "John Doe"
    assert html =~ "Great stuff!"
    assert html =~ "Very happy with the quality."
    # 4 stars
    assert length(Regex.scan(~r/<svg/, html)) == 4
  end

  test "renders variant_selector" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.variant_selector id="size" name="size" label="Size">
        <:option value="s" label="S" checked={true} />
        <:option value="m" label="M" />
      </.variant_selector>
      """)

    assert html =~ "Size"
    assert html =~ "value=\"s\""
    assert html =~ "checked"
    assert html =~ "value=\"m\""
  end

  test "renders product_collection" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.product_collection title="Summer Collection" subtitle="Hot items">
        <li>Product 1</li>
      </.product_collection>
      """)

    assert html =~ "Summer Collection"
    assert html =~ "Hot items"
    assert html =~ "Product 1"
    assert html =~ "Sort By"
  end

  test "renders quantity_input" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
      <.quantity_input id="qty" name="quantity" value={3} />
      """)

    assert html =~ "id=\"qty\""
    assert html =~ "value=\"3\""
    assert html =~ "plus"
  end
end

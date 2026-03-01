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
end

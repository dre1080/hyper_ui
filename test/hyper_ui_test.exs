defmodule HyperUITest do
  use ExUnit.Case
  doctest HyperUI

  test "has __using__ macro" do
    assert {:__using__, 1} in HyperUI.__info__(:macros)
  end
end

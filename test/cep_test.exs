defmodule CepTest do
  use ExUnit.Case
  doctest Cep

  test "greets the world" do
    assert Cep.hello() == :world
  end
end

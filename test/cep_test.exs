defmodule CepTest do
  use ExUnit.Case

  import Mock

  describe "fetch/1" do
    test "with a valid cep" do
      body =
        Jason.encode!(%{
          cep: "01001-000",
          logradouro: "Praça da Sé",
          complemento: "lado ímpar",
          bairro: "Sé",
          localidade: "São Paulo",
          uf: "SP",
          ibge: "3550308",
          gia: "1004",
          ddd: "11",
          siafi: "7107"
        })

      with_mock HTTPoison,
        get: fn _url -> {:ok, %HTTPoison.Response{status_code: 200, body: body}} end do
        assert Jason.decode(body) == Cep.fetch("01001000")
      end
    end

    test "with an invalid cep" do
      body = """
      <body data-new-gr-c-s-check-loaded="14.1121.0" data-gr-ext-installed="">
      <h1>Http 400</h1>
      <h3>Verifique a URL</h3>
      <h3>{Bad Request}</h3>
      </body>
      """

      with_mock HTTPoison,
        get: fn _url -> {:ok, %HTTPoison.Response{status_code: 400, body: body}} end do
        assert {:error, "CEP not found"} == Cep.fetch("invalid")
      end
    end
  end
end

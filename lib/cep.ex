defmodule Cep do
  @moduledoc """
  Documentation for `Cep`.
  """

  @doc """
  Fetch CEP from viacep website

  ## Examples

    iex> Cep.fetch("01001000")
      {:ok,
      %{
        "bairro" => "Sé",
        "cep" => "01001-000",
        "complemento" => "lado ímpar",
        "ddd" => "11",
        "gia" => "1004",
        "ibge" => "3550308",
        "localidade" => "São Paulo",
        "logradouro" => "Praça da Sé",
        "siafi" => "7107",
        "uf" => "SP"
      }}

    iex> Cep.fetch("invalid")
      {:error, "CEP not found"}
  """

  def fetch(cep) do
    url = "https://viacep.com.br/ws/#{cep}/json/"

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        Jason.decode(body)

      {:ok, %HTTPoison.Response{status_code: 400, body: _body}} ->
        {:error, "CEP not found"}
    end
  end
end

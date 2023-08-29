defmodule Cep do
  @moduledoc """
  Documentation for `Cep`.
  """

  @doc """
  Fetch CEP from viacep website
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

# Cep

Basic library to fetch CEP from viacep website.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `cep` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:cep, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/cep>.


## Usage

```
Cep.fetch("01001000")

{:ok,
{
  "cep": "01001-000",
  "logradouro": "Praça da Sé",
  "complemento": "lado ímpar",
  "bairro": "Sé",
  "localidade": "São Paulo",
  "uf": "SP",
  "ibge": "3550308",
  "gia": "1004",
  "ddd": "11",
  "siafi": "7107"
}}
```

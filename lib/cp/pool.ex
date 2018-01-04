defmodule Cp.Pool do
  use Ecto.Schema
  import Ecto.Changeset
  alias Cp.Pool


  schema "transactions" do
    field :amount, :float
    field :btc_amount, :float
    field :coin, :string
    field :time, :utc_datetime
    field :usd_amount, :float
    field :payload, :map

    timestamps()
  end

  @doc false
  def changeset(%Pool{} = pool, attrs) do
    pool
    |> cast(attrs, [:coin, :amount, :btc_amount, :usd_amount, :time])
    |> validate_required([:coin, :amount, :btc_amount, :usd_amount, :time])
  end
end

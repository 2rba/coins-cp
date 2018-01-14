defmodule Cp.Pool do
  use Ecto.Schema
  import Ecto.Changeset
  alias Cp.Pool


  schema "transactions" do
    field :coin, :string
    field :trx_id, :integer
    field :amount, :float
    field :btc_amount, :float
    field :time, Timex.Ecto.DateTime
    field :usd_amount, :float
    field :payload, :map

    timestamps()
  end

  def save_transactions do
    Cp.Mph.Api.transactions("feathercoin")
    |> Enum.sort(&(&1["id"] < &2["id"]))
  end

  @doc false
  def changeset(%Pool{} = pool, attrs) do
    pool
    |> cast(attrs, [:coin, :trx_id, :amount, :btc_amount, :time, :usd_amount, :payload])
    |> validate_required([:coin])
  end
end

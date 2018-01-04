defmodule Cp.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :coin, :string
      add :amount, :float
      add :btc_amount, :float
      add :usd_amount, :float
      add :time, :utc_datetime
      add :payload, :map

      timestamps()
    end

  end
end

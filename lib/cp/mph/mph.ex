defmodule Cp.Mph do

  def save_transactions do
    stats = Cp.Mph.Api.statistics
    Enum.each Cp.Coins.list_coins, fn(coin) ->
      IO.puts(coin)
      stat = coin_stats(coin, stats)
      btc_rate = get_btc_rate(stat)
      trxs = Cp.Mph.Api.transactions(coin)
      Enum.each trxs, fn(data) ->
        time = Timex.parse!(data["timestamp"], "%Y-%m-%d %H:%M:%S", :strftime)
        insert_or_update!(%{
          coin: coin,
          trx_id: data["id"],
          amount: data["amount"],
          time: time
        })
      end
    end
  end

  def get_btc_rate(stat) do
    %{"highest_buy_price" => rate} = stat
  end

  def coin_stats(coin, stats) do
    Enum.find stats, fn(e) ->
      match?(%{"coin_name" => coin}, e)
    end
  end

  def insert_or_update!(changes) do
#    changes = %{coin: "feathercoin", trx_id: 2, amount: 1.3}
    case Cp.Repo.get_by(Cp.Pool, changes) do
      nil -> %Cp.Pool{} # Post not found, we build one
      trx -> trx          # Post exists, let's use it
    end
    |> Cp.Pool.changeset(changes)
    |> Cp.Repo.insert_or_update!
  end
end

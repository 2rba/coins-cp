defmodule Cp.Mph.Page do

  def daily(coin) do
    %HTTPoison.Response{body: body} = HTTPoison.get! "https://#{coin}.miningpoolhub.com/index.php?page=statistics&action=pool"
    body
    |> Floki.find(".tablesorter:first-child tbody tr")
    |> Enum.map(fn(row) ->
      td = row |> elem(2)
      [{_,_,[hashrate]}, {_,_,[daily]}] = td |> Enum.take(-2)
      { hashrate |> String.replace(",","") |> Float.parse |> elem(0), daily |> String.replace(",","") |> Float.parse |> elem(0) }
    end)
    |> Enum.reduce({0, 0}, fn(x, acc) ->
      {a1, b1} = x
      {a2, b2} = acc
      {a1+a2, b1+b2}
    end)
    |> (fn(t) ->
      { hashrate, daily} = t
      daily / hashrate
    end).()
  end
end

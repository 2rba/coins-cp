defmodule Cp.Nicehash.Api do

  def orders(location, algo) do
    %{"result" => %{"orders" => orders} } = fetch("orders.get", %{location: location, algo: algo})
    orders
  end

  defp fetch(method, params) do
    HTTPoison.start
    IO.puts(url(method, params))
    %HTTPoison.Response{body: body} = HTTPoison.get! url(method, params)
    Poison.decode! body
  end

  defp url(method, params \\ %{}) do
    query = URI.encode_query(params)
    ["https://api.nicehash.com/api?method=#{method}", query]
    |> Enum.filter( & String.first(&1) )
    |> Enum.join("&")
  end
end

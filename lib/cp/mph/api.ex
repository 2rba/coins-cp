defmodule Cp.Mph.Api do

  def statistics do
    %{"return" => coins } = fetch("getminingandprofitsstatistics")
    coins
  end

  def transactions(coin) do
    %{"getusertransactions" => %{"data" => %{"transactions" => trx }}} = fetch("getusertransactions", coin)
    trx
  end

  def url(action) do
    uri(action, "")
  end

  def url(action, coin) do
    uri(action, coin <> ".")
  end

  defp fetch(action, coin) do
    HTTPoison.start
    IO.puts(url(action, coin))
    %HTTPoison.Response{body: body} = HTTPoison.get! url(action, coin)
    Poison.decode! body
  end

  defp fetch(action) do
    fetch(action, "")
  end

  defp uri(action, coin_dot) do
    "https://#{coin_dot}miningpoolhub.com/index.php?page=api&action=#{action}&api_key=#{api_key()}"
  end

  defp api_key do
    Application.get_env(:cp, :api_key)
  end
end

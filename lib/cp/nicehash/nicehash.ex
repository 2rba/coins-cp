defmodule Cp.Nicehash do
  @algos [
    0, #Scrypt
    3, #X11
    #X13 ???
    5, #Keccak
    #X15
    #Nist5
    8, #NeoScrypt
    #11, #Qubit
    #12, #Quark
    14, #Lyra2REv2
    #19, #Hodl
    20, #Ethash
    #21, #Decred
    22, #CryptoNight
    #23, #Lbry
    24, #Equihash
    #25, #Pascal
    #26, #X11Gost
    27, #Sia
    #28, #Blake2s
    #29, #Skunk
  ]

  def algos_list do
    @algos
  end

  def save_orders do
    Enum.each algos_list, fn(algo) ->
      Enum.each [0, 1], fn(location) ->
        save_algo_orders(location, algo)
      end
    end
  end

  defp save_algo_orders(location, algo) do
    orders = Cp.Nicehash.Api.orders(location, algo)
    Enum.each orders, fn(order) ->
      IO.puts("---")
      IO.puts(order["limit_speed"])
      data = %Cp.Nicehash.Orders{}
      data = %{ data | fields: %{ data.fields |
        price: order["price"],
        accepted_speed: order["accepted_speed"],
        workers: order["workers"],
        limit_speed: order["limit_speed"],
        alive: order["alive"],
        order_id: order["id"],
        type: order["type"]
      }}
      data = %{ data | tags: %{ data.tags | location: location, algo: algo }}
      data |> Cp.Influx.write()
    end
  end
end

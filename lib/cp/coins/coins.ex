defmodule Cp.Coins do
  @coins  [
    "monero", #cryptonight
    "electroneum", #cryptonight
    "expanse", #Ethash
    "ethereum", #Ethash
    "musicoin", #Ethash
    "ethereum-classic", #Ethash
    "zclassic", #equihash
    "zencash", #equihash
    "bitcoin-gold", #equihash
    "zcash", #equihash
    "groestlcoin", #groestl
    "monacoin", #lyra2v2
    "vertcoin", #lyra2v2
    "zcoin", #lyra2z
    "digibyte-groestl", #myr-gr
    "myriadcoin-groestl", #myr-gr
    "feathercoin", #neoscrypt
    "digibyte-skein", #skein
    "myriadcoin-skein", #skein
  ]

  def list_coins do
    @coins
  end
end

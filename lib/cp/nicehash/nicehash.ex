defmodule Nicehash do
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
end

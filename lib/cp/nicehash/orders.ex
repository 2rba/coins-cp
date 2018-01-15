defmodule Cp.Nicehash.Orders do
  use Instream.Series

  series do
    database    "cp_dev"
    measurement "orders"

    tag :location
    tag :algo

    field :price
    field :accepted_speed
    field :workers
    field :limit_speed
    field :alive
    field :order_id
    field :type
  end
end

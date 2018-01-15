defmodule Cp.Nicehash.Worker do
  use GenServer

  def start_link(params) do
    start_link
  end

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    handle_info(:work, state)
    {:ok, state}
  end

  def handle_info(:work, state) do
    # Do the desired work here
    IO.puts("working")
    Cp.Nicehash.save_orders
    schedule_work() # Reschedule once more
    {:noreply, state}
  end

  defp schedule_work() do
    Process.send_after(self(), :work, 30 * 1000) # In 2 hours
  end
end

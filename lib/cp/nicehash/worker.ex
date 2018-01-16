defmodule Cp.Nicehash.Worker do
  use GenServer

  def start_link(params) do
    start_link
  end

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    schedule_work(1000) # Reschedule once more
    {:ok, state}
  end

  def handle_info(:work, state) do
    # Do the desired work here
    IO.puts("working")
    Cp.Nicehash.save_orders
    schedule_work(30 * 1000) # Reschedule once more
    {:noreply, state}
  end

  defp schedule_work(time) do
    Process.send_after(self(), :work, time) # In 2 hours
  end
end

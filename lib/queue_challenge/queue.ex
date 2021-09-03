defmodule QueueChallenge.Queue do
  use GenServer

  require Logger

  def start_link(initial_state) do
    GenServer.start_link(__MODULE__, initial_state)
  end

  def enqueue(pid, element) do
    GenServer.call(pid, {:push, element})
  end

  def dequeue(pid) do
    GenServer.cast(pid, :pop)
  end

  @impl true
  def init(state) do
    Logger.info("Queue started")

    {:ok, state}
  end

  @impl true
  def handle_call({:push, element}, _from, state) do
    new_queue = state ++ [element]

    {:reply, new_queue, new_queue}
  end

  @impl true
  def handle_cast(:pop, [_head | tail]) do
    {:noreply, tail}
  end
end

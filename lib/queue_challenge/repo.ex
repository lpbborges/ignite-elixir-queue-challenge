defmodule QueueChallenge.Repo do
  use Ecto.Repo,
    otp_app: :queue_challenge,
    adapter: Ecto.Adapters.Postgres
end

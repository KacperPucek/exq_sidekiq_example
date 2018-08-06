defmodule PhoenixAppWeb.GreeterController do
  use PhoenixAppWeb, :controller

  alias Exq.Enqueuer

  def create(conn, %{"name" => name}) do
    {:ok, _ack} = Enqueuer.enqueue(Enqueuer, "default", "GreeterJob", [name])

    send_resp(conn, 201, "")
  end
end

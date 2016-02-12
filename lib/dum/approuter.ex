
defmodule AppRouter do
  use Plug.Router
  plug Plug.Logger
  plug :match
  plug :dispatch

  get "/hello" do
    send_resp(conn, 200, "#{inspect __MODULE__}, #{inspect self}")
  end

  #forward "/users", to: UsersRouter

  match _ do
    send_resp(conn, 200, "oops")
  end
end

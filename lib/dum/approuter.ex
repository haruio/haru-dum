defmodule AppRouter do
  use Plug.Router
  use BookDatabase
  use Amnesia

  plug Plug.Logger
  plug Plug.Static, at: "/public", from: "my_app"
  plug :match
  plug :dispatch

 
  get "/hello" do
    Amnesia.Schema.create
    Amnesia.start
    BookDatabase.create(disk: [node])
    BookDatabase.wait

    Amnesia.transaction do
      # ... initial data creation
      %Book{sku: "9710747591054", author: "J. K. Rowling", title: "Harry Potter and the Deathly Hallows"}
      |> Book.write
    end

    #Amnesia.stop

    send_resp(conn, 200, "#{inspect __MODULE__}, #{inspect self}")
  end

  match _ do
    IO.inspect conn
    IO.inspect conn.body_params
    send_resp(conn, 200, "helloworld")
  end

end



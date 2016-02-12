defmodule Dum do
  use Application
  def start( _type, _args ) do
    import Supervisor.Spec, warn: false

    children = [
      worker(__MODULE__, [], function: :run)
    ]

    opts = [strategy: :one_for_one, name: Dum.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def run do
    { :ok, _ } = Plug.Adapters.Cowboy.http AppRouter, []
  end
end

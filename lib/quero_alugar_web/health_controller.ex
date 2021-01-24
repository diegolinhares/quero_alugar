defmodule QueroAlugarWeb.HealthController do
  use Phoenix.Controller

  def index(conn, _params) do
    text(conn, "ok")
  end
end

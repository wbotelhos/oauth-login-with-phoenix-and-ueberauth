defmodule BibleWeb.Plugs.CurrentUser do
  import Plug.Conn

  def init(params), do: params

  def call(conn, _params) do
    current_user = get_session(conn, :current_user)

    assign(conn, :current_user, current_user)
  end
end

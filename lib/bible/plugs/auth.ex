defmodule BibleWeb.Plugs.Auth do
  import Plug.Conn
  import Phoenix.Controller

  alias BibleWeb.Router.Helpers, as: Routes

  def init(params), do: params

  def call(%{assigns: %{current_user: nil}} = conn, _params) do
    conn
    |> put_flash(:info, "You must be logged in.")
    |> redirect(to: Routes.page_path(conn, :index))
    |> halt()
  end

  def call(conn, _params), do: conn
end

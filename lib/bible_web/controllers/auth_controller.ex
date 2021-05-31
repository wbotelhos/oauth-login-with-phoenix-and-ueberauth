defmodule BibleWeb.AuthController do
  use BibleWeb, :controller

  alias Bible.Repo
  alias Bible.User

  plug Ueberauth

  def callback(%{assigns: assigns} = conn, _params) do
    case assigns do
      %{ueberauth_failure: %{errors: [errors]}} ->
        %{message: message} = errors

        conn
        |> put_flash(:error, message)
        |> redirect(to: Routes.page_path(conn, :index))

      %{ueberauth_auth: %{
        credentials: %{token: token},
        info: %{email: email, image: image},
        provider: provider}
      } ->
        changeset = User.changeset(%User{},
          %{email: email, image: image, provider: Atom.to_string(provider), token: token}
        )

        signin(conn, changeset)
    end
  end

  def signout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> put_flash(:info, "See you soon.")
    |> redirect(to: Routes.page_path(conn, :index))
  end

  defp signin(conn, changeset) do
    case upsert(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> put_session(:current_user, user)
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, _error} ->
        conn
        |> put_flash(:error, "Signin failed!")
        |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  defp upsert(changeset) do
    case Repo.get_by(User, email: changeset.changes.email, provider: changeset.changes.provider) do
      nil -> Repo.insert(changeset)
      user -> Repo.update(User.changeset(user, %{image: changeset.changes.image}))
    end
  end
end

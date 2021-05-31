defmodule Bible.User do
  import Ecto.Changeset

  use Ecto.Schema

  schema "users" do
    field :email, :string
    field :image, :string
    field :provider, :string
    field :token, :string

    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:email, :image, :provider, :token])
    |> validate_required([:email, :provider, :token])
  end
end

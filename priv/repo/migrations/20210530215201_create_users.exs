defmodule Bible.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :provider, :string
      add :image, :string
      add :token, :string

      timestamps()
    end
  end
end

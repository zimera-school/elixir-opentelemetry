defmodule HrService.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :email, :string
      add :occupation, :string
      add :address, :string

      timestamps()
    end

    create unique_index(:employees, [:email])
  end
end

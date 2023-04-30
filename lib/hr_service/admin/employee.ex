defmodule HrService.Admin.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "employees" do
    field :address, :string
    field :email, :string
    field :name, :string
    field :occupation, :string

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:name, :email, :occupation, :address])
    |> validate_required([:name, :email, :occupation, :address])
    |> unique_constraint(:email)
  end
end

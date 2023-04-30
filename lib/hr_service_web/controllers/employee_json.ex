defmodule HrServiceWeb.EmployeeJSON do
  alias HrService.Admin.Employee

  @doc """
  Renders a list of employees.
  """
  def index(%{employees: employees}) do
    %{data: for(employee <- employees, do: data(employee))}
  end

  @doc """
  Renders a single employee.
  """
  def show(%{employee: employee}) do
    %{data: data(employee)}
  end

  defp data(%Employee{} = employee) do
    %{
      id: employee.id,
      name: employee.name,
      email: employee.email,
      occupation: employee.occupation,
      address: employee.address
    }
  end
end

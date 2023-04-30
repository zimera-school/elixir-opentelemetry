defmodule HrServiceWeb.EmployeeController do
  use HrServiceWeb, :controller

  alias HrService.Admin
  alias HrService.Admin.Employee

  action_fallback HrServiceWeb.FallbackController

  def index(conn, _params) do
    employees = Admin.list_employees()
    render(conn, :index, employees: employees)
  end

  def create(conn, %{"employee" => employee_params}) do
    with {:ok, %Employee{} = employee} <- Admin.create_employee(employee_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/employees/#{employee}")
      |> render(:show, employee: employee)
    end
  end

  def show(conn, %{"id" => id}) do
    employee = Admin.get_employee!(id)
    render(conn, :show, employee: employee)
  end

  def update(conn, %{"id" => id, "employee" => employee_params}) do
    employee = Admin.get_employee!(id)

    with {:ok, %Employee{} = employee} <- Admin.update_employee(employee, employee_params) do
      render(conn, :show, employee: employee)
    end
  end

  def delete(conn, %{"id" => id}) do
    employee = Admin.get_employee!(id)

    with {:ok, %Employee{}} <- Admin.delete_employee(employee) do
      send_resp(conn, :no_content, "")
    end
  end
end

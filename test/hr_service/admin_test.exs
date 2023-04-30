defmodule HrService.AdminTest do
  use HrService.DataCase

  alias HrService.Admin

  describe "employees" do
    alias HrService.Admin.Employee

    import HrService.AdminFixtures

    @invalid_attrs %{address: nil, email: nil, name: nil, occupation: nil}

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert Admin.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert Admin.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      valid_attrs = %{address: "some address", email: "some email", name: "some name", occupation: "some occupation"}

      assert {:ok, %Employee{} = employee} = Admin.create_employee(valid_attrs)
      assert employee.address == "some address"
      assert employee.email == "some email"
      assert employee.name == "some name"
      assert employee.occupation == "some occupation"
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      update_attrs = %{address: "some updated address", email: "some updated email", name: "some updated name", occupation: "some updated occupation"}

      assert {:ok, %Employee{} = employee} = Admin.update_employee(employee, update_attrs)
      assert employee.address == "some updated address"
      assert employee.email == "some updated email"
      assert employee.name == "some updated name"
      assert employee.occupation == "some updated occupation"
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_employee(employee, @invalid_attrs)
      assert employee == Admin.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = Admin.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = Admin.change_employee(employee)
    end
  end
end

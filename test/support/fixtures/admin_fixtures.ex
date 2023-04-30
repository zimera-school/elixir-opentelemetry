defmodule HrService.AdminFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `HrService.Admin` context.
  """

  @doc """
  Generate a unique employee email.
  """
  def unique_employee_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a employee.
  """
  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(%{
        address: "some address",
        email: unique_employee_email(),
        name: "some name",
        occupation: "some occupation"
      })
      |> HrService.Admin.create_employee()

    employee
  end
end

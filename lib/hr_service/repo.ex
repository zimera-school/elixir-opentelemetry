defmodule HrService.Repo do
  use Ecto.Repo,
    otp_app: :hr_service,
    adapter: Ecto.Adapters.Postgres
end

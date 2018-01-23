defmodule RogerDemo.Job.CreateUpdateUser do
  use Roger.Job
  alias RogerDemo.{Repo, User}

  def perform(attrs) do
    Process.sleep(1000)
    case Repo.get_by(User, email: attrs["email"]) do
      nil -> %User{}
      user -> user
    end
    |> User.changeset(attrs)
    |> Repo.insert_or_update()
  end
end

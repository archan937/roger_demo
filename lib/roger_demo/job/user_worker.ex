defmodule RogerDemo.Job.CreateUpdateUser do
  use Roger.Job
  alias RogerDemo.{Repo, User}

  def perform(attrs) do
    case Repo.get_by(User, email: attrs["email"]) do
      nil -> %User{number_of_pets: 0}
      user -> user
    end
    |> User.changeset(attrs)
    |> Repo.insert_or_update()
  end
end

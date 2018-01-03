defmodule RogerDemoWeb.PageController do
  use RogerDemoWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create_or_update(conn, %{"email" => email} = params) when email != "" do
    Enum.each(1..10000, fn(i) ->
      attrs =
        params
        |> Map.take(~w(name email bio))
        |> Map.put("number_of_pets", i)

      {:ok, job} = Roger.Job.create(RogerDemo.Job.CreateUpdateUser, attrs)
      Roger.Job.enqueue(job, "roger_demo_partition", :default)
    end)
    text conn, "OK"
  end
  def create_or_update(conn, _params), do: text conn, "Idle"
end

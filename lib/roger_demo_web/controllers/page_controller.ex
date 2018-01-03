defmodule RogerDemoWeb.PageController do
  use RogerDemoWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create_or_update(conn, %{"email" => email} = params) when email != "" do
    {:ok, job} = Roger.Job.create(RogerDemo.Job.CreateUpdateUser, Map.take(params, ~w(name email bio)))
    Roger.Job.enqueue(job, "roger_demo_partition", :default)
    text conn, "OK"
  end
  def create_or_update(conn, _params), do: text conn, "Idle"
end

defmodule RogerDemoWeb.PageController do
  use RogerDemoWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
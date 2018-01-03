defmodule RogerDemoWeb.PageController do
  use RogerDemoWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create_or_update(conn, _params) do
    text conn, "OK"
  end
end

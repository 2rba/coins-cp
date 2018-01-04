defmodule CpWeb.PageController do
  use CpWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

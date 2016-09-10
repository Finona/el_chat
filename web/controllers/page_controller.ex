defmodule ElChat.PageController do
  use ElChat.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

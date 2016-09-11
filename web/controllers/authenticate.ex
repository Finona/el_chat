defmodule ElChat.Plugs.Authenticate do
	import Plug.Conn
	import Phoenix.Controller, only: [put_flash: 3, redirect: 2]
	import ElChat.Session, only: [current_user: 1]
	import ElChat.Router.Helpers

	def init(default), do: default

	def call(conn, default) do
		case current_user(conn) do
		nil ->
			conn
			|> put_flash(:error, "You must login")
			|> redirect(to: session_path(conn, :new))
			|> halt
		_ -> conn
		end
	end
end
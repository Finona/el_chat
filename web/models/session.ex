defmodule ElChat.Session do
	alias ElChat.Repo
	alias ElChat.User
	def login(session_params) do
		user = Repo.get_by!(User, %{email: String.downcase(session_params["email"])})
		case authenticate(user, session_params["password"]) do
		   true -> {:ok, user}
		   _ -> :error
		end
	end

	defp authenticate(user, password) do
		Comeonin.Bcrypt.checkpw(password, user.crypted_password)
	end
end
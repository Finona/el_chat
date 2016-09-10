defmodule ElChat.Session do
	alias ElChat.Repo
	alias ElChat.User

	def login(params) do
    	user = Repo.get_by(User, email: String.downcase(params["email"]))
    	case authenticate(user, params["password"]) do
      		true -> {:ok, user}
      		_    -> :error
   		 end
 	 end

  	defp authenticate(user, password) do
    	case user do
	    	nil -> false
	    	_   -> Comeonin.Bcrypt.checkpw(password, user.crypted_password)
   		end
   	end
end
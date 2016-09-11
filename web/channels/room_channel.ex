defmodule ElChat.RoomChannel do
	use Phoenix.Channel
	alias ElChat.User
	alias ElChat.Repo
	alias ElChat.Message

	def join("room:" <> _room_name, _params, socket) do
		{:ok, socket}
	end

	def handle_in("new_msg", %{"body" => body, "user" => user_email, "room_id" => room_id}, socket) do
		create_message(body, user_email, room_id)
		broadcast! socket, "new_msg", %{body: body, user: user_email}
		{:noreply, socket}
	end


	defp create_message(body, user_email, room_id) do
		user = Repo.get_by!(User, %{email: user_email})
		params = %{body: body, user_id: user.id, room_id: room_id}
		Message.changeset(%Message{}, params)
		|> Repo.insert!

	end
end
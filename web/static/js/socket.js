import {Socket} from "phoenix"

let socket = new Socket("/socket", {})
socket.connect()

let roomId = $('#room-id').text()
let channel = socket.channel(`room:${roomId}`, {})

let messageContainer = $("#chat-box")
let user = $("#current-user").text()
channel.on("new_msg", payload => {
	messageContainer.append(`<span style="color: white;"><br/>[${user}]: ${payload.body}</span>`)
})

channel.join()

let chatInput = $('#chat-input')
chatInput.on("keypress", event => {
	if(event.keyCode == 13){
		channel.push("new_msg", {body: chatInput.val()} )
		chatInput.val("")
	}
})

export default socket

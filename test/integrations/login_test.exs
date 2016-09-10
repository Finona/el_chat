defmodule ElChat.LoginTest do
	use ElChat.IntegrationCase
	alias ElChat.User
	alias ElChat.Repo

	@tag :integration
	test "login" do
		User.changeset(%User{},%{email: "super@gmail.com", password: "kurczak"})
		|> ElChat.Registration.create

		navigate_to "/login"
		login_form = find_element(:css, "form")

		login_form
		|> find_within_element(:id, "session_email")
		|> fill_field("super@gmail.com")	

		login_form
		|> find_within_element(:id, "session_password")
		|> fill_field("kurczak")

		login_form
		|> submit_element

		assert page_source =~ "Successfully logged in!"	
	end
end
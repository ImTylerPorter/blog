class AdminMailer < ApplicationMailer
	default from: "no-reply@tylerporter.me"
	default to: "hello@tylerporter.me"

	def new_user(user)
		@user = user
		mail(subject: "New user: #{user.email}")
	end
end

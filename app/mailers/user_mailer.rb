class UserMailer < ApplicationMailer

	def welcome_email(user)
		@user = user
		@url = "http://www.lelabo-ondemand.com"
		mail( to: @user.email, subject: "Bienvenue sur le Labo" )
	end

	def launch_email(user)
		@user = user
		@url = "http://www.lelabo-ondemand.com"
		mail( to: @user.email, subject: "Lancement officiel")
	end

end

class UserMailer < ApplicationMailer

	def welcome_email(user)
		@user = user
		@url = "http://www.sweetkit.io"
		mail( to: @user.email, subject: "Bienvenue sur Sweetkit" )
	end

	def launch_email(user)
		@user = user
		@url = "http://www.sweetkit.io"
		mail( to: @user.email, subject: "Offre de lancement")
	end

	def feedback_email(feedback)
		@feedback = feedback
		@url = "http://www.sweetkit.io"
		mail( to: 'bonjour@sweetkit.io', subject: "New feedback Sweetkit" )
	end

	def subscription_email(user)
		@user = user
		@url = "http://www.sweetkit.io"
		mail( to: 'timothee.gauguet@orange.fr', subject: "Nouvelle commande Sweetkit" )
	end

	def send_recipe(message, user)
		@message = message
		@url = "http://www.sweetkit.io"
		mail( to: message.email, subject: message.subject, from: (user ? user.email : "bonjour@sweetkit.io"))
	end

	def new_website(user)
		@url = "http://www.sweetkit.io"
		mail( to: user.email, subject: "Nouveau Sweetkit!")
	end

end

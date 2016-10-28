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

	def feedback_email(feedback)
		@feedback = feedback
		@url = "http://www.lelabo-ondemand.com"
		mail( to: 'bonjour@lelabo-ondemand.com', subject: "New feedback Le Labo" )
	end

	def subscription_email(user)
		@user = user
		@url = "http://www.lelabo-ondemand.com"
		mail( to: 'timothee.gauguet@orange.fr', subject: "Nouvelle commande Le Labo" )
	end

end

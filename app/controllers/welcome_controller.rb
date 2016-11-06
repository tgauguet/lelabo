class WelcomeController < ApplicationController

	def index
		if !@user.account_name?
			redirect_to nom_de_votre_compte_path
		elsif !@user.name?
			redirect_to informations_de_votre_compte_path
		elsif !@user.terms?
			redirect_to confirmation_de_votre_compte_path
		end
	end

end

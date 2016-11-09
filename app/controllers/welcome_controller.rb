class WelcomeController < ApplicationController

	def index
		if @user && !@user.account_name?
			redirect_to nom_de_votre_compte_path
		elsif @user && !@user.name?
			redirect_to informations_de_votre_compte_path
		elsif @user && !@user.terms?
			redirect_to confirmation_de_votre_compte_path
		end
	end

end

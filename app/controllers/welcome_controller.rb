class WelcomeController < ApplicationController

	def index
		if @user.account_name.blank?
			redirect_to nom_de_votre_compte_path
		elsif @user.name.blank?
			redirect_to informations_de_votre_compte_path
		end
	end

end

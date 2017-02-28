class WelcomeController < ApplicationController

	def index
		if @user && !@user.account_name?
			redirect_to nom_de_votre_compte_path
		elsif @user && !@user.name?
			redirect_to informations_de_votre_compte_path
		elsif @user && !@user.terms?
			redirect_to confirmation_de_votre_compte_path
		end
		date = Date.today - 30
		@recipes = @user.recipes.count(:conditions=>["created_at >= ?", date], :order => 'DATE(created_at) DESC', :group => ["DATE(created_at)"])
	end

end

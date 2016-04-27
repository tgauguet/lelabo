class WelcomeController < ApplicationController

	def index
		@user = current_user
		if @user.account_name.blank?
			redirect_to nom_de_votre_compte_path
		elsif @user.name.blank?
			redirect_to informations_de_votre_compte_path
		else
			@feedback = @user.feedbacks.new
		end
	end

end

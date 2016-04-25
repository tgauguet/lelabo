class WelcomeController < ApplicationController

	def index
		@user = current_user
		@feedback = @user.feedbacks.new
	end

end

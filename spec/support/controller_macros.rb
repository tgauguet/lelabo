module ControllerMacros
	def login_user
		user = FactoryGirl.create(:user)
		user.confirm!
		sign_in user
		allow(controller).to receive(:current_user) { user }
	end
end

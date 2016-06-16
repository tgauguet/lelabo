require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

	describe "#index" do
		it "expect to render index page" do
			login_user
			get :index
			expect(response).to render_template(:index)
		end
		it "expect to validate if account name is blank" do
			user = FactoryGirl.create(:user, account_name: nil)
			allow(controller).to receive(:current_user) { user }
			expect(user.account_name).to be_blank
			expect( get: "/nom-de-votre-compte" ).to be_routable
		end
		it "expect to validate if user name is blank" do
			user = FactoryGirl.create(:user, name: nil)
			allow(controller).to receive(:current_user) { user }
			expect(user.name).to be_blank
			expect( get: "/informations-de-votre-compte" ).to be_routable
		end
	end

end

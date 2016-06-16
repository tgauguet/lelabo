require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

	describe "#create" do
		it "expect to send a new message" do
			login_user
			post :create, contact: attributes_for(:contact)
			expect(Contact.count).to eq(0)
		end
		it "expect to redirect to root path and flash message case success" do
			login_user
			post :create, contact: attributes_for(:contact)
			expect(response).to redirect_to root_path
			expect(flash[:notice]).to be_present
		end
	end

	# contact routes
	describe "contact routes" do
		it "expect contacts to be routable" do
			expect( post: "/contacts" ).to be_routable
			expect( get: "/contacts/new" ).to be_routable
		end
	end

end

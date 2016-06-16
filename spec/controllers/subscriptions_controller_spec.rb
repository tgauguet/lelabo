require 'rails_helper'

RSpec.describe SubscriptionsController, type: :controller do

	#index subscription
	describe "#index" do
		it "expect to render index page" do
			get :index
			expect(response).to render_template(:index)
		end
	end

	#subscriptions routes
	describe "subscriptions routes" do
		it "expect subscriptions to be routable" do
			expect( get: "/subscriptions" ).to be_routable
			expect( post: "/subscriptions" ).to be_routable
			expect( get: "/subscriptions/new" ).to be_routable
			expect( get: "/subscriptions/:id/edit" ).to be_routable
			expect( patch: "/subscriptions/:id" ).to be_routable
			expect( put: "/subscriptions/:id" ).to be_routable
		end
	end

end

require 'rails_helper'

RSpec.describe FeedbacksController, type: :controller do

	#validates feedback creation
	describe "#create feedback" do
		context "with valid attributes" do
			it "expect to create feedback" do
				post :create, feedback: attributes_for(:feedback)
				expect(Feedback.count).to eq(1)
			end
			it "expect to render root path" do
				post :create, feedback: attributes_for(:feedback)
				expect(response).to redirect_to root_path
				expect(flash[:success]).to be_present
			end
		end
		context "with no valid attributes" do
			it "expect to render error" do
				post :create, feedback: attributes_for(:feedback, message: nil)
				expect(Feedback.count).to eq(0)
			end
			it "expect to render root path" do
				post :create, feedback: attributes_for(:feedback, message: nil)
				expect(response).to redirect_to root_path
				expect(flash[:error]).to be_present
			end
		end
	end

	#validates feedbacks index
	describe "index feedbacks" do
		it "expect to render index view" do
			login_user
			get :index
			expect(response).to render_template(:index)
		end
	end

	#validates feedbacks destroy method
	describe "/feedbacks/:id(.:format)" do
		before(:each) do
			feed1 = FactoryGirl.create(:feedback)
			feed2 = FactoryGirl.create(:feedback)
			delete :destroy, { id: feed1.id }
		end
		it "expect feed1 to be destroyed" do
			expect(Feedback.count).to eq(1)
			expect(response).to redirect_to feedbacks_path
		end
	end

	#validates feedbacks routes
	describe "feedbacks routes" do
		it "expect links to be routable" do
			expect( get: "/feedbacks" ).to be_routable
			expect( post: "/feedbacks" ).to be_routable
			expect( delete: "/feedbacks/:id" ).to be_routable
		end
	end

end

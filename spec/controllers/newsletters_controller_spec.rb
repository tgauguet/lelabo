require 'rails_helper'

RSpec.describe NewslettersController, type: :controller do

	#create newsletters
	describe "#create" do
		context "case success" do
			before(:each) do
				FactoryGirl.create(:newsletter)
			end
			it "expect to create a newsletter" do
				expect(Newsletter.count).to eq(1)
			end
		end
	end

end

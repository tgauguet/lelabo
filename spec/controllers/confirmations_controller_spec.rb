require "rails_helper"

RSpec.describe ConfirmationsController, type: :controller do

	it "expect to confirm user email" do
		user = FactoryGirl.build(:user)
		user.confirm!
	end

end
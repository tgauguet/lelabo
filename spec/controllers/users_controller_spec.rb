require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	before :each do
		@user = User.new :email => "timo"
	end

	describe "#new" do 
		it "takes one parameter and return a user object" do
			@user.should be_an_instance_of User
		end
	end

	describe "#edit" do
		it "edit parameters and return a user object" do
			@user.should_not be_new_record
		end
	end

end

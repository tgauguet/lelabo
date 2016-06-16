require 'rails_helper'

RSpec.describe Subscription, type: :model do
  
	it "expect Subscription to belongs to user" do
		Subscription.reflect_on_association(:user).macro.should eq(:belongs_to)
	end

	it "expect subscription to belongs to plan" do
		Subscription.reflect_on_association(:plan).macro.should eq(:belongs_to)
	end
	
end

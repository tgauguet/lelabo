require 'rails_helper'

RSpec.describe Plan, type: :model do
  
	it "expect uniqueness of stripe_id" do
		plan1 = FactoryGirl.create(:plan, stripe_id: "foobar")
		plan2 = FactoryGirl.build(:plan, stripe_id: "foobar")
		expect(plan1).to be_valid
		expect(plan2).to be_invalid
	end

end

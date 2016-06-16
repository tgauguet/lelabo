require 'rails_helper'

RSpec.describe Feedback, type: :model do
  
	it "expect to belongs to user" do
		Feedback.reflect_on_association(:user).macro.should eq(:belongs_to)
	end

	it "expect to validates presence of message" do
		expect(build(:feedback, message: nil)).to be_invalid
	end

end

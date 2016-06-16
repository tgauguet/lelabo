require 'rails_helper'

RSpec.describe Newsletter, type: :model do
  
	it "has a valid email" do
		expect(build(:newsletter)).to be_valid
	end

	it "expect to be invalid without email" do
		expect(build(:newsletter, email: nil)).to be_invalid
	end

	it "expect blank email to be invalid" do
		expect(build(:newsletter, email: " ")).to be_invalid
	end

	it "expect a good format of email" do
		email_format = "tot@gmail,com"
		email_format_sec = "foo_at_bar.com"
		expect(build(:newsletter, email: email_format)).to be_invalid
		expect(build(:newsletter, email: email_format_sec)).to be_invalid
	end

	it "expect uniqueness from email" do
		email1 = FactoryGirl.create(:newsletter, email: "foo@bar.com")
		email2 = FactoryGirl.build(:newsletter, email: "foo@bar.com")
		expect(email1).to be_valid
		expect(email2).not_to be_valid
	end

end

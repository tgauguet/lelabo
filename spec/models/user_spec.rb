require 'rails_helper'

RSpec.describe User, type: :model do
  
	it "expect to validate email format" do
		email1 = "toto@gmail,com"
		email2 = "totoatgmail.com"
		expect(build(:user, email: email1, account_name: "test")).to be_invalid
		expect(build(:user, email: email2, account_name: "test2")).to be_invalid
	end

	it "expect user to have many different associations" do
		User.reflect_on_association(:feedbacks).macro.should eq(:has_many)
		User.reflect_on_association(:to_do_lists).macro.should eq(:has_many)
		User.reflect_on_association(:ingredients).macro.should eq(:has_many)
		User.reflect_on_association(:subscription).macro.should eq(:has_one)
	end

	it "expect email to be present" do
		expect(build(:user, email: nil)).to be_invalid
	end

	describe "#password_required?" do
		it "expect password to be confirmed" do
			expect(build(:user, email: "foo@bar.com", password: "foobar", password_confirmation: nil)).to be_invalid
		end
	end

end

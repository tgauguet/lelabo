require 'rails_helper'

RSpec.describe Task, type: :model do
  
	it "expect presence of name" do
		expect(build(:task, name: nil)).to be_invalid
	end

	it "expect to belongs_to a to_do list" do
		Task.reflect_on_association(:to_do_list).macro.should eq(:belongs_to)
	end

end

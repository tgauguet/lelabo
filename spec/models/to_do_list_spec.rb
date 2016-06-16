require 'rails_helper'

RSpec.describe ToDoList, type: :model do
  
	it "expect todolist to belongs to user" do
		ToDoList.reflect_on_association(:user).macro.should eq(:belongs_to)
	end

	it "expect todolist to have many tasks" do
		ToDoList.reflect_on_association(:tasks).macro.should eq(:has_many)
	end

	it "expect to count the number of tasks" do
		list = FactoryGirl.build(:to_do_list)
		count = list.total_tasks
		expect(count).to be 0
		expect(list.all_done).to be nil
	end

end

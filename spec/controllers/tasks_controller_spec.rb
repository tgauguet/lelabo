require 'rails_helper'

RSpec.describe TasksController, type: :controller do

	#create tasks
	describe "#create" do
		before(:each) do
			@todolist = FactoryGirl.create(:to_do_list)
			task = FactoryGirl.create(:task, to_do_list_id: @todolist.id)
		end
		it "expect to create task" do
			expect(Task.count).to eq(1)
		end
	end

	#update tasks
	describe "#update" do
		it "expect to update tasks" do
			user = FactoryGirl.create(:user)
			allow(controller).to receive(:current_user) { user }
			todolist = FactoryGirl.create(:to_do_list, user_id: user.id)
			task = FactoryGirl.create(:task, to_do_list_id: todolist.id, name: "foo" )
			put :update, to_do_list_id: todolist.id, id: task.id, task: attributes_for(:task, name: "bar" )
			task.reload
			expect(task.name).to eq("bar")
		end
	end

	#delete tasks
	describe "#destroy" do
		before(:each) do
			@todolist = FactoryGirl.create(:to_do_list)
			task = FactoryGirl.create(:task, to_do_list_id: @todolist.id)
			delete :destroy, { to_do_list_id: task.to_do_list_id, id: task.id }
		end
		it "expect todolist tasks to be empty" do
			expect(@todolist.tasks.count).to eq(0)
		end
	end

	#tasks routes
	describe "tasks routes" do
		it "expect tasks to be routable" do
			expect( patch: "/to_do_lists/:to_do_list_id/tasks/:id/done").to be_routable
			expect( get: "/to_do_lists/:to_do_list_id/tasks").to be_routable
			expect( post: "/to_do_lists/:to_do_list_id/tasks").to be_routable
			expect( get: "/to_do_lists/:to_do_list_id/tasks/new").to be_routable
			expect( get: "/to_do_lists/:to_do_list_id/tasks/:id/edit").to be_routable
			expect( get: "/to_do_lists/:to_do_list_id/tasks/:id").to be_routable
			expect( patch: "/to_do_lists/:to_do_list_id/tasks/:id").to be_routable
			expect( put: "/to_do_lists/:to_do_list_id/tasks/:id").to be_routable
			expect( delete: "/to_do_lists/:to_do_list_id/tasks/:id").to be_routable
		end
	end

end

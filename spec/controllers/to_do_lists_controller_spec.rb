require 'rails_helper'

RSpec.describe ToDoListsController, type: :controller do

	#create to do list
	describe "#create" do
		it "expect to create a new list" do
			login_user
			post :create, to_do_list: attributes_for(:to_do_list)
			expect(ToDoList.count).to eq(1)
		end
	end

	#show to do lists
	describe "#show" do
		it "expect to render template show" do
			user = FactoryGirl.create(:user)
			allow(controller).to receive(:current_user) { user }
			to_do_list = FactoryGirl.create(:to_do_list, user_id: user.id)
			get :show, { user_id: user.id, id: to_do_list.id }
			expect(response).to render_template(:show)
		end
	end

	#update to do lists
	describe "#update" do
		it "expect to update to_do_list" do
			user = FactoryGirl.create(:user)
			allow(controller).to receive(:current_user) { user }
			to_do_list = FactoryGirl.create(:to_do_list, user_id: user.id, title: "foo")
			put :update, user_id: user.id, id: to_do_list.id , to_do_list: attributes_for(:to_do_list, title: "bar")
			to_do_list.reload
			expect(to_do_list.title).to eq("bar")
		end
	end

	#delete to do lists
	describe "#destroy" do
		before do
			user = FactoryGirl.create(:user)
			allow(controller).to receive(:current_user) { user }
			to_do_list = FactoryGirl.create(:to_do_list, user_id: user.id)
			@user = to_do_list.user_id
			delete :destroy, { user_id: @user, id: to_do_list.id }
		end
		it "expect to_do_list to be destroyed" do
			expect(ToDoList.count).to eq(0)
		end
	end

	#routes to_do_lists
	describe "routes to_do_lists" do
		it "expect links to be routable" do
			expect( get: "/to_do_lists" ).to be_routable
			expect( post: "/to_do_lists" ).to be_routable
			expect( get: "/to_do_lists/new" ).to be_routable
			expect( get: "/to_do_lists/:id/edit" ).to be_routable
			expect( get: "/to_do_lists/:id" ).to be_routable
			expect( patch: "/to_do_lists/:id" ).to be_routable
			expect( put: "/to_do_lists/:id" ).to be_routable
			expect( delete: "/to_do_lists/:id" ).to be_routable
		end
	end

end

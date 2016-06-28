require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do

	#validates ingredients creation
	describe "#create" do
		context "with valid attributes" do
			it "expect to create ingredients" do
				login_user
				post :create, ingredient: attributes_for(:ingredient)
				expect(Ingredient.count).to eq(1)
			end
			it "expect to render new" do
				login_user
				post :create, ingredient: attributes_for(:ingredient)
				expect(response).to redirect_to new_ingredient_path
			end
		end
		context "with invalid attributes" do
			it "expect to render an error" do
				login_user
				post :create, ingredient: attributes_for(:ingredient, name: nil)
				expect(Ingredient.count).to eq(0)
			end
		end
	end

	#validates update ingredients
	describe "#update" do
		it "expect ingredient to be updated" do
			login_user
			ingredient = FactoryGirl.create(:ingredient, name: "farine")
			put :update, id: ingredient.id, ingredient: attributes_for(:ingredient, name: "sucre")
			ingredient.reload
			puts ingredient.name
			expect(ingredient.name).to eq("sucre")
		end
	end

	#validates delete ingredients
	describe "#destroy" do
		before(:each) do
			ingredient = FactoryGirl.create(:ingredient)
			delete :destroy, { id: ingredient.id }
		end
		it "must have no ingredients" do
			expect(Ingredient.count).to eq(0)
		end
	end

	#ingredients routes
	describe "ingredients routes" do
		it "expect ingredients to be routable" do
			expect( get: "/ingredients" ).to be_routable
			expect( post: "/ingredients" ).to be_routable
			expect( get: "/ingredients/new" ).to be_routable
			expect( get: "/ingredients/:id/edit" ).to be_routable
			expect( get: "/ingredients/:id" ).to be_routable
			expect( patch: "/ingredients/:id" ).to be_routable
			expect( put: "/ingredients/:id" ).to be_routable
			expect( delete: "/ingredients/:id" ).to be_routable
		end
	end

end


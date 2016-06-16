class IngredientsController < ApplicationController
	before_action :set_ingredients, only: [:new]
	before_action :set_user
	before_action :set_ingredient, only: [:update, :destroy]

	def update
		@current_ingredient.update(ingredients_params)
		redirect_to new_ingredient_path
	end

	def new
		@ingredient = @user.ingredients.new
	end

	def index
	end

	def create
		@ingredient = @user.ingredients.new(ingredients_params)
		@ingredient.save
		redirect_to new_ingredient_path
	end

	def destroy
		@current_ingredient.destroy
		redirect_to new_ingredient_path
	end 

	private

	def set_user
		@user = current_user
	end

	def set_ingredient
		@current_ingredient = Ingredient.find(params[:id])
	end

	def set_ingredients
		@ingredients = @user.ingredients.all
	end

	def ingredients_params
		params.require(:ingredient).permit(:name, :quantity, :unit, :user_id, :recipe_id, :price)
	end

end

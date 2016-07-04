class IngredientsController < ApplicationController
	before_action :set_user
	before_action :set_ingredient, only: [:update, :destroy]

	def update
		@current_ingredient.update(ingredients_params)
		redirect_to new_ingredient_path
	end

	def new
		@ingredient = @user.ingredients.new
		@ingredients = @user.ingredients.all.order("priority ASC, name ASC")
	end

	#removed waiting for activation of solr on heroku (because of the 20$/mo invoice)
	
	#this code took place in ingredients/new.html.erb
	#<%= form_tag search_ingredients_path, method: :get do %>
	#		<%= image_tag "search-btn.png", class: "search-btn" %>
	#		<%= text_field_tag :search, "", class: "search-field", placeholder: "rechercher..." %>
	#		<%= submit_tag "go", class: "search-go" %>
	#<% end %><br/>

	#def search
	#	@ingredient = @user.ingredients.new
	#	@ingredients = @user.ingredients.all.order("name ASC")
	#	@search = Ingredient.search do
	#		fulltext params[:search]
	#	end
	#	@results = @search.results
	#	respond_to do |format|
	#		format.html { render :search }
	#		format.xml { render xml: @results }
	#	end
	#end

	def sort
		# adjust the position of each task with jquery sortable
		# inspired by tutorial : http://josephndungu.com/tutorials/ajax-sortable-lists-rails-4
		params[:order].each do |key, value|
			Ingredient.find(value[:id]).update_attribute(:priority, value[:position])
		end
		render :nothing => true
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

	def ingredients_params
		params.require(:ingredient).permit(:name, :quantity, :unit, :user_id, :recipe_id,:fat_percent, :water_percent, :sugar_percent, :alcool_percent, :dry_matter_percent, :cocoa_percent, :cocoa_butter_percent, :cocoa_total_percent, :priority, :price, :category, :ordering )
	end

end

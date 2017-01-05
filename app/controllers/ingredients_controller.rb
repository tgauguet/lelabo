#!usr/bin/env ruby
#encoding: utf-8

class IngredientsController < ApplicationController
	before_action :set_user
	before_action :set_ingredient, only: [:update, :edit]
	before_action :has_access?, only: [:update, :edit]
	helper_method :sort_columns, :sort_direction

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

	def new
		@ingredient = @user.ingredients.new
		@ingredients = @user.ingredients.all.paginate(page: params[:page], per_page: 20).order(sort_columns + " " + sort_direction)
	end

	def edit
	end

	def create
		@ingredient = @user.ingredients.create(ingredients_params)
		if @ingredient.save
			flash[:success] = "Votre nouvel ingrédient à été créé"
		else
			flash[:error] = "Erreur - vous devez donner un nom à chaque nouvel ingrédient"
		end
		redirect_to new_ingredient_path
	end

	def update
		@ingredient.update(ingredients_params)
		redirect_to new_ingredient_path
	end

	def destroy
		@current_ingredient = Ingredient.find(params[:id])
		if @current_ingredient.destroy
			flash[:success] = "Supprimé"
		else
			flash[:success] = "Supression annulée, l'ingrédient est utilisé dans une ou plusieurs recettes"
		end
		redirect_to new_ingredient_path
	end

	private

	def has_access?
		@ingredient= Ingredient.find(params[:id])
		redirect_to page_error_path unless user_signed_in? && (@ingredient.user_id == current_user.id)
	end

	def sort_columns
		Ingredient.column_names.include?(params[:sort]) ? params[:sort] : "name"
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end

	def set_user
		@user = current_user
	end

	def set_ingredient
		@ingredient = Ingredient.find(params[:id])
	end

	def ingredients_params
		params.require(:ingredient).permit(:name, :unit_weight, :composition, :ig, :protein, :salt, :carbohydrates, :unit_quantity, :weight, :vat, :brand, :sugar_power, :quantity, :is_bio, :is_glut_free, :is_pulp, :unit, :user_id, :kcal, :recipe_id,:fat_percent, :water_percent, :sugar_percent, :alcool_percent, :dry_matter_percent, :cocoa_percent, :cocoa_butter_percent, :cocoa_total_percent, :priority, :price, :category, :ordering, provider_prices_attributes: [ :id, :price, :_destroy, :ingredient_id, :provider_id ] )
	end

end

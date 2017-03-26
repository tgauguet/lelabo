#!usr/bin/env ruby
#encoding: utf-8

class IngredientsController < ApplicationController
	before_action :set_user
	before_action :set_ingredient, only: [:update, :edit, :show]
	helper_method :sort_columns, :sort_direction
	require 'will_paginate/array'

	def index
		@categories = Category.all
		@public_ingredients = Ingredient.all.where(to_public: 1)
		@user_ingredients = @user.ingredients.all.order("name ASC")
		@ingredients = @public_ingredients + @user_ingredients
		if params[:category_id]
			@category = Category.find params[:category_id]
			@ingredients = @category.ingredients
		elsif params[:search]
			@ingredients = Ingredient.all.where(to_public: 1).search(params[:search]).order("name DESC") + @user.ingredients.search(params[:search]).order("name ASC")
    else
			@ingredients = @ingredients.sort_by(&:"#{sort_columns}")
			@ingredients = @ingredients.reverse if sort_direction == 'desc'
    end
		@ingredients = @ingredients.paginate(:page => params[:page], :per_page => 30)
	end

	def show
		@categories = Category.all
		@prices = @ingredient.provider_prices.where(user_id: @user.id).order('priority ASC')
		@providers = @user.providers.all + Provider.where(to_public: true).all
	end

	def new
		@ingredient = @user.ingredients.new
		@categories = Category.all
	end

	def edit
		@categories = Category.all
	end

	def create
		@ingredient = @user.ingredients.create(ingredients_params)
  	if request.referrer.include?('ingredients')
			if @ingredient.save
				flash[:notice] = "Nouvel ingrédient créé avec succès"
			else
				flash[:error] = "Erreur lors de la création"
			end
			redirect_to ingredients_path
		else
			if @ingredient.save
				respond_to do |format|
					format.js { flash[:notice] = "Nouvel ingrédient créé avec succès"}
				end
			else
				respond_to do |format|
					format.js { flash[:notice] = "Erreur lors de la création"}
				end
			end
			redirect_to new_ingredient_path
		end
	end

	def update
		@ingredient.update(ingredients_params)
		redirect_to ingredient_path
	end

	def destroy
		@current_ingredient = Ingredient.find(params[:id])
		if @current_ingredient.destroy
			flash[:notice] = "L'ingrédient a été supprimé"
		else
			flash[:error] = "Supression annulée, l'ingrédient est utilisé dans une ou plusieurs recettes"
		end
		redirect_to :back
	end

	def sort
		params[:order].each do |key, value|
			ProviderPrice.find(value[:id]).update_attribute(:priority, value[:position])
		end
		render :nothing => true
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
 		params.require(:ingredient).permit(:name, :brut_weight, :unit_weight, :to_public, :composition, :ig, :protein, :salt, :carbohydrates, :unit_quantity, :weight, :vat, :brand, :sugar_power, :quantity, :is_bio, :is_glut_free, :is_pulp, :unit, :user_id, :kcal, :recipe_id,:fat_percent, :water_percent, :sugar_percent, :alcool_percent, :dry_matter_percent, :cocoa_percent, :cocoa_butter_percent, :cocoa_total_percent, :priority, :price, :category_id, :ordering, provider_prices_attributes: [ :id, :price, :_destroy, :ingredient_id, :provider_id, :user_id, :reference, :unit ] )
	end

end

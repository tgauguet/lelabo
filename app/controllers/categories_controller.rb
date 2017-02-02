#!usr/bin/env ruby
#encoding: utf-8

class CategoriesController < ApplicationController
  before_action :set_user, only: [:new, :create, :destroy]

  def new
    @category = @user.category.new
    @categories = @user.category.all
  end

  def create
    @category = @user.category.create(cat_params)
    if @category
      flash[:notice] = "Félicitations, vous avez créé une nouvelle catégorie d'ingrédients."
      redirect_to new_ingredient_path
    else
      flash[:error] = "Erreur lors de la création d'une catégorie."
      redirect_to :back
    end
  end

  def destroy
    @category = Category.find_by_id params[:id]
    @category.destroy
    redirect_to new_category_path
  end

  def set_user
    @user = current_user
  end

  private

  def cat_params
    params.require(:category).permit(:name, :user_id)
  end
end

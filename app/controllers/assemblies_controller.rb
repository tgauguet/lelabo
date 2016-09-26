#!usr/bin/env ruby
#encoding: utf-8

class AssembliesController < ApplicationController
	before_action :set_assembly, only: [:show, :edit, :update, :destroy]
	before_action :set_user
	helper_method :sort_columns, :sort_direction

	def index
		@assemblies = @user.assemblies.all.paginate(page: params[:page], per_page: 20).order(sort_columns + " " + sort_direction)
	end

	def show
	end

	def new
		@assembly = @user.assemblies.new
	end

	def create
		@assembly = @user.assemblies.create(assembly_params)
		if @assembly
			redirect_to @assembly
			flash[:success] = "Vous avez créé un nouveau montage"
		else
			redirect_to assemblies_path
			flash[:error] = "Erreur lors de la création du montage"
		end
	end

	def destroy
		if @assembly.destroy
			redirect_to assemblies_path
			flash[:success] = "Le montage a été supprimé"
		else
			redirect_to(:back)
			flash[:error] = "Erreur lors de la suppression du montage"
		end
	end

	def edit
	end

	def update 
		if @assembly.update(assembly_params)
			redirect_to @assembly
			flash[:success] = "Votre montage a bien été modifié"
		else
			redirect_to(:back)
			flash[:error] = "Erreur lors de la modification du montage"
		end
	end

	private

	def sort_columns
		Assembly.column_names.include?(params[:sort]) ? params[:sort] : "title"
	end

	def sort_direction
		%w[asc desc].include?(params[:desc]) ? params[:desc] : "asc"
	end

	def set_user
		@user = current_user
	end

	def set_assembly
		@assembly = Assembly.find(params[:id])
	end

	def assembly_params
		params.require(:assembly).permit(:recipe_id, :image, :description, :title, :owner)
	end
end

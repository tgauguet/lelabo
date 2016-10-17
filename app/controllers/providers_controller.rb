#!/usr/bin/env ruby
#encoding: utf-8

class ProvidersController < ApplicationController
	before_action :set_user
	helper_method :sort_columns, :sort_direction

	def index
		@providers = @user.providers.all.paginate(page: params[:page], per_page: 20).order(sort_columns + " " + sort_direction)
	end

	def show
		@provider = Provider.find(params[:id])
	end

	def new
		@provider = @user.providers.new
	end

	def create
		@provider = @user.providers.create(providers_params)
		if @provider.valid?
			redirect_to @provider
			flash[:success] = "Vous avez créé un nouveau fournisseur"
		else
			redirect_to providers_path
			flash[:error] = "Une erreur à eu lieu lors de la création du fournisseur"
		end
	end

	def edit
		@provider = Provider.find(params[:id])
	end

	def update
		@provider = Provider.find(params[:id])
		if @provider.update(providers_params)
			flash[:success] = "Le fournisseur a été modifié"
		else
			flash[:error] = "Erreur lors de la modification du fournisseur"
		end
		redirect_to provider_path
	end

	def destroy
		@provider = Provider.find(params[:id])
		if @provider.destroy
			flash[:success] = "Le fournisseur a été supprimé"
		else
			flash[:error] = "Erreur lors de la suppression du fournisseur"
		end
		redirect_to(:back)
	end

	private

	def sort_columns
		Provider.column_names.include?(params[:sort]) ? params[:sort] : "name"
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end

	def set_user
		@user = current_user
	end

	def providers_params
		params.require(:provider).permit(:name, :adress, :city, :postal, :country, :email, :website, :phone, :fax, :mobile_phone, :vat, :siret, :notes, :user_id)
	end

end

#!/usr/bin/env ruby
#encoding: utf-8

class ProvidersController < ApplicationController
	before_action :set_user
	before_action :has_access?, only: [:update, :destroy]
	helper_method :sort_columns, :sort_direction
	before_action :set_provider, only: [:show, :edit, :update, :destroy]

	def index
		@providers = Provider.all.where(to_public: 1) + @user.providers.all
		@providers = @providers.sort_by(&:"#{sort_columns}")
		@providers = @providers.reverse if sort_direction == 'desc'
		@providers = @providers.paginate(:page => params[:page], :per_page => 30)
	end

	def new
		@provider = @user.providers.new
	end

	def show
		@ingredients = @user.ingredients.all
		@provider_prices = @user.provider_prices.where(provider_id: @provider.id)
	end

	def create
		@provider = @user.providers.create(providers_params)
		if @provider.valid?
			redirect_to providers_path
			flash[:notice] = "Vous avez créé un nouveau fournisseur"
		else
			redirect_to providers_path
			flash[:error] = "Une erreur à eu lieu lors de la création du fournisseur"
		end
	end

	def edit
	end

	def update
		if @provider.update(providers_params)
			flash[:notice] = "Le fournisseur a été modifié"
		else
			flash[:error] = "Erreur lors de la modification du fournisseur"
		end
		redirect_to providers_path
	end

	def destroy
		if @provider.destroy
			flash[:notice] = "Le fournisseur a été supprimé"
		else
			flash[:error] = "Erreur lors de la suppression du fournisseur"
		end
		redirect_to(:back)
	end

	private

	def set_provider
		@provider = Provider.find(params[:id])
	end

	def has_access?
		@provider= Provider.find(params[:id])
		redirect_to page_error_path unless user_signed_in? && (@provider.user_id == current_user.id)
	end

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

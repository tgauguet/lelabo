#!/usr/bin/env ruby
# encoding: utf-8

class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy, :finish_signup]

	def show
	end

	def edit
	end

	def update
		if params[:user][:password].blank?
			params[:user].delete("password")
			params[:user].delete("password_confirmation")
		end

		respond_to do |format|
			if @user.update(user_params)
				@user.save
				sign_in @user, bypass: true
				format.html {
					flash[:notice] = "Votre compte utilisateur à été modifié avec succès"
					redirect_to user_path
				}
				format.json { 
					head :no_content 
				}
			else
				format.html {
					redirect_to user_path
					flash[:error] = "Erreur lors de la modification de votre compte"
				}
				format.json {
					render json: @user.errors, status: :unprocessable_entity
				}
			end
		end
	end

	def finish_signup
		if request.patch? && params[:user]
			if @user.update(user_params)
				sign_in(@user, bypass: true)
				UserMailer.welcome_email(@user).deliver_now
				SuscribeUserToMailingListJob.perform_later(@user)
			else
				redirect_to @user
				flash[:notice] = "Vous êtes maintenant connecté"
			end
		end
	end

	def destroy
		@user.destroy
		redirect_to root_url
	end

	private

	def set_user
		@user = current_user
	end

	def user_params
		accessible = [:name, :email, :firstname, :company, :job, :phone, :company_logo, :image]
		accessible << [:password, :password_confirmation] unless params[:user][:password].blank?
		params.require(:user).permit(accessible)
	end

end

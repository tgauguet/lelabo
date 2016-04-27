#!/usr/bin/env ruby
# encoding: utf-8

class UsersController < ApplicationController
	before_action :set_user

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
					if !@user.account_name.nil? && @user.firstname.nil?
				      redirect_to informations_de_votre_compte_path
				    elsif !@user.account_name.nil? && !@user.firstname.nil? && @user.terms == true
				      redirect_to root_path
				    elsif !@user.account_name.nil? && !@user.firstname.nil?
				      SubscribeUserToMailingListJob.perform_later(@user)
				      redirect_to confirmation_de_votre_compte_path(@user)
				    elsif @user.account_name.nil?
				      redirect_to nom_de_votre_compte_path(@user)
				    end
				}
				format.json { 
					head :no_content 
				}
			else
				format.html {
					redirect_to root_path
					flash[:error] = "Erreur lors de la modification de votre compte"
				}
				format.json {
					render json: @user.errors, status: :unprocessable_entity
				}
			end
		end
	end

	def second_step
		@user = current_user
	end

	def final_step
		@user = current_user
	end

	def first_step
		@user = current_user
	end

	def edit_profile
		@user = current_user
	end

	def parameters
		@user = current_user
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
		accessible = [:name, :email, :country, :avatar, :firstname, :company, :is_female, :job_type, :phone, :company_image, :phone, :skype, :profile_image, :account_name, :terms]
		accessible << [:password, :password_confirmation] unless params[:user][:password].blank?
		params.require(:user).permit(accessible)
	end

end

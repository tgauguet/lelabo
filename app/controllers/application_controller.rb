#!user/bin/env ruby
# encoding: utf-8

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_newsletter
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_new_column_to_devise_permitted_parameters, if: :devise_controller?
  after_filter :store_location
  before_action :set_feedbacks_and_user

  def set_feedbacks_and_user
    @feedback = Feedback.new
    @user = current_user
  end

  def set_newsletter
    @newsletter = Newsletter.new
  end

  def after_sign_in_path_for(resource)
    @user = current_user
    if @user.company.nil?
      nom_de_votre_compte_url
    else
      root_path
    end
  end

  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/utilisateur/
  end

  def respond_modal_with(*args, &blk)
    options = args.extract_options!
    options[:responder] = ModalResponder
    respond_with *args, options, &blk
  end

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation,:current_password, :date_of_birth, :pseudo, :firstname, :job, :status, :country, :city, :account_name) }
  end

  def configure_new_column_to_devise_permitted_parameters
      registration_params = [:name, :firstname, :email, :account_name, :password, :password_confirmation, :oauthdelivered]
      if params[:action] == 'create'
          devise_parameter_sanitizer.for(:sign_up) {
              |u| u.permit(registration_params)
          }
          elsif params[:action] == 'update'
          devise_parameter_sanitizer.for(:account_update) {
              |u| u.permit(registration_params << :current_password)
          }
      end
  end

end


class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_newsletter
  before_filter :ensure_signup_complete, only: [:new, :create, :update]
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_new_column_to_devise_permitted_parameters, if: :devise_controller?

  def set_newsletter
    @newsletter = Newsletter.new
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def ensure_signup_complete
      # Ensure we don't go into an infinite loop
      return if action_name == 'finish_signup'
      # Redirect to the 'finish_signup' page if the user
      # email hasn't been verified yet
      if current_user && !current_user.email_verified?
          redirect_to finish_signup_path(current_user)
      end
  end

  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/utilisateur/
  end

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation,:current_password, :is_female, :date_of_birth, :avatar, :pseudo, :firstname, :job, :status, :country, :city) }
  end

  def configure_new_column_to_devise_permitted_parameters
      registration_params = [:name, :firstname, :email, :password, :password_confirmation, :oauthdelivered]
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

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_newsletter
  before_filter :add_www_subdomain

  def set_newsletter
    @newsletter = Newsletter.new
  end

  private
  def add_www_subdomain
    unless /^www/.match(request.host)
      redirect_to("#{request.protocol}www.#{request.host_with_port}",status: 301)
    end
  end
end

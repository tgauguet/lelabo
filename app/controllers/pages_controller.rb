class PagesController < ApplicationController

  def metrics
    @users = User.all
  end

end

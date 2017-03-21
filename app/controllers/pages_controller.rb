class PagesController < ApplicationController

  def metrics
    @users = User.all.order("created_at DESC")
  end

end

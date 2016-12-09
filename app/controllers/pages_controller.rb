class PagesController < ApplicationController

  def metrics
    @users = User.last(10)
    @recipes = Recipe.last(10)
    @assemblies = Assembly.last(10)
    @sub = Subscription.last(10)
  end

end

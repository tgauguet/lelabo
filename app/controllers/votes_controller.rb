class VotesController < ApplicationController

  def create
    @new_vote = @user.votes.create(vote_params)
    @recipe = Recipe.find(@new_vote.recipe_id)
    @vote = Vote.new
  end

  def destroy
    @vote.destroy
  end

  private

  def set_vote
    @vote = Vote.find(params:[:vote_id])
  end

  def vote_params
    params.require(:vote).permit(:user_id, :recipe_id, :up)
  end
end

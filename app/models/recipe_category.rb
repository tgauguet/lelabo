class RecipeCategory < ActiveRecord::Base
  belongs_to :user
  has_many :recipes
end

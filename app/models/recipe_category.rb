class RecipeCategory < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :recipes, :dependent => :restrict_with_error
end

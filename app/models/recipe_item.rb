class RecipeItem < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :assembly
  default_scope { order(:id) }
end

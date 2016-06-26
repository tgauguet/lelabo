class Ingredient < ActiveRecord::Base
	belongs_to :user
	has_one :ingredient_category, dependent: :destroy
	validates :name, presence: true
	accepts_nested_attributes_for :ingredient_category, allow_destroy: true
	searchable do
		text :name, :stored => true
	end
end

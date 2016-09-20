class Recipe < ActiveRecord::Base
	belongs_to :user
	belongs_to :assembly, dependent: :destroy
	has_many :ingredients, through: :quantity
	has_many :quantities, dependent: :destroy
	accepts_nested_attributes_for :quantities, :reject_if => lambda { |a| a[:quantity].blank? || a[:ingredient_id].blank? }, allow_destroy: true
	validates_presence_of :name

	def total_price
		self.quantities.collect { |q| q.price }.sum
	end
end

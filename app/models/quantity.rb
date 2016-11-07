class Quantity < ActiveRecord::Base
	belongs_to :ingredient
	belongs_to :recipe
	default_scope { order(:id) }
	before_save :default_value

	def default_value
		# set the value at 100 if nil
		self.weight = 100 unless self.weight
	end

	def price
		price = self.ingredient.price * self.weight
	end

	def percent
		percent = self.weight * 100 / self.recipe.total_weight
		percent.round(2)
	end

	def updated_value
		value = self.recipe.total_weight * percent / 100
		value.round(2)
	end
end

class Quantity < ActiveRecord::Base
	belongs_to :ingredient
	belongs_to :recipe

	def price
		price = self.ingredient.price * self.weight
	end
end
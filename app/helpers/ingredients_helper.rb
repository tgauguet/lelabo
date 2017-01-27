module IngredientsHelper

	def price_is_nil(ingredient)
		ingredient.price == "" || ingredient.price.nil?
	end

end

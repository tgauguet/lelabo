module IngredientsHelper

	def price_is_nil(ingredient)
		ingredient.price == "" || ingredient.price.nil?
	end

	def weighing_unit(ingredient)
		if ingredient.unit == "Kg"
			"g"
		elsif ingredient.unit == "Litre"
			"ml"
		end
	end

end

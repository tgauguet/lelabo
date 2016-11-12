module IngredientsHelper

	def price_is_nil(ingredient)
		ingredient.price == "" || ingredient.price.nil?
	end

	def weighing_unit(ingredient)
		if ingredient.unit == "Kg"
			"g"
		elsif ingredient.unit == "Litre"
			"ml"
		else
			"U"
		end
	end

	def weighing_quantities(ingredient, recipe)
		if ingredient.unit == "Kg"
			recipe.unit == "kilogrammes" ? "Kg" : "g"
		elsif ingredient.unit == "Litre"
			recipe.unit == "kilogrammes" ? "L" : "ml"
		end
	end

end

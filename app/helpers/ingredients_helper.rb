module IngredientsHelper

	def category_color(ingredient)
		i = ingredient.category
		if i == "Chocolats"
			"brown-cat"
		elsif i == "Divers"
			"royal-cat"
		elsif i == "Céréales"
			"sunflower-cat"
		elsif i == "Sucres"
			"swimming-cat"
		elsif i == "Produits laitiers"
			"blue-cat"
		elsif i == "Fruits"
			"strawberry-cat"
		elsif i == "Décors"
			"pink-cat"
		elsif i == "Additifs"
			"lavender-cat"
		elsif i == "Alcools"
			"mint-cat"
		elsif i == "Épices"
			"pumpkin-cat"
		elsif i == "Fruits secs"
			"avacado-cat"
		elsif i == "Purées de fruits"
			"emerald-cat"
		else
			"grey-cat"
		end
	end

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

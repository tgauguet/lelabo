module IngredientsHelper

	def category_color(ingredient)
		i = ingredient.category
		if i == "Chocolats"
			"brown-cat"
		elsif i == "Divers"
			"grey-cat"
		elsif i == "Céréales"
			"orange-cat"
		elsif i == "Sucres"
			"white-cat"
		elsif i == "Produits laitiers"
			"blue-cat"
		elsif i == "Fruits"
			"red-cat"
		elsif i == "décors"
			"pink-cat"
		elsif i == "Additifs"
			"green-cat"
		elsif i == "Alcools"
			"green-cat"
		elsif i == "Épices"
			"green-cat"
		elsif i == "Fruits secs"
			"green-cat"
		elsif i == "Légumes"
			"green-cat"
		elsif i == "Purées de fruits"
			"green-cat"
		else
		end
	end

	def price_is_nil(ingredient)
		ingredient.price == "" || ingredient.price.nil?
	end

end

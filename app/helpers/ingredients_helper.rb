module IngredientsHelper

	def category_color(ingredient)
		i = ingredient.category
		if i == "chocolats"
			"brown-cat"
		elsif i == "divers"
			"grey-cat"
		elsif i == "céréales"
			"orange-cat"
		elsif i == "sucres"
			"white-cat"
		elsif i == "produits laitiers"
			"blue-cat"
		elsif i == "fruits"
			"red-cat"
		elsif i == "décors"
			"pink-cat"
		elsif i == "emballages"
			"green-cat"
		else
		end	
	end

	def order_by_cat
		
	end

	def price_is_nil(ingredient)
		ingredient.price == "" || ingredient.price.nil?
	end

end
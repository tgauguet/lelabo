module IngredientsHelper

	def price_is_nil(ingredient)
		ingredient.price == "" || ingredient.price.nil?
	end

	def weighing_unit(qtity)
		if (qtity.unit == "Kg" || qtity.unit == "kg")
			"g"
		elsif (qtity.unit == "Litre" || qtity.unit == "L")
			"ml"
		elsif qtity.unit == "Unité"
			"U"
		else
			qtity.unit
		end
	end

	def q_weighing_unit(qtity)
		if (qtity.unit == "Kg" || qtity.unit == "kg")
			"g"
		elsif (qtity.unit == "Litre" || qtity.unit == "L")
			"ml"
		elsif qtity.unit == "Unité"
			"U"
		else
			qtity.unit
		end
	end

end

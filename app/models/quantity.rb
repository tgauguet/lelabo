class Quantity < ActiveRecord::Base
	belongs_to :ingredient
	belongs_to :recipe
	default_scope { order(:id) }
	before_save :default_value

	def default_value
		# set the value at 100 if nil and 0 if QS
		self.weight = 0 if self.unit == "QS"
		self.weight = 100 unless self.weight
	end

	def price
		price = self.ingredient.price * self.weight
	end

	# calculate the weight of each ingredients in grammes
	def quantity_weight
		if self.unit == "U"
			self.weight * self.ingredient.unit_weight
		elsif self.unit == "Kg" || self.unit == "kg"
			self.weight * 1000
		elsif self.unit == "Litre" || self.unit == "L"
			self.weight * 1000
		elsif self.unit == "QS"
			0
		else
			self.weight
		end
	end

	def percent
		percent = self.weight * 100 / self.recipe.total_weight
		percent.round(2)
	end

	def updated_value
		value = self.recipe.total_weight * percent / 100
		value.round(2)
	end

	def quantity_wanted
		if self.recipe.unit == "parts"
			(self.recipe.portion_weight.to_f * self.recipe.to_product.to_f).to_f
		elsif self.recipe.unit == "#{self.recipe.portion_name}"
			(self.recipe.portion.to_f  * self.recipe.to_product.to_f).to_f
		elsif self.recipe.unit == "recettes"
			((self.recipe.totals.first.value.to_f * self.recipe.to_product.to_f) * 1000).to_f
		elsif self.recipe.unit == "grammes"
			self.recipe.to_product.to_f
		elsif self.recipe.unit == "kilogrammes"
			self.recipe.to_product.to_f * 1000
		else
			self.weight
		end
	end

	def perfect_weight
		if self.recipe.to_product
			weight = self.weight * self.quantity_wanted / self.recipe.recipe_weight
			if ((self.unit == "kg" || self.unit == "Kg") && weight < 1)
				(self.weight * 1000 * self.quantity_wanted / self.recipe.recipe_weight).to_i
			elsif ((self.unit == "L" || self.unit == "Litre") && weight < 1)
				(self.weight * 1000 * self.quantity_wanted / self.recipe.recipe_weight).to_i
			elsif ((self.unit == "g" || self.unit == "grammes") && weight > 9999)
				(weight / 1000).round(2)
			elsif (self.unit == "ml" && weight > 9999)
				(weight / 1000).round(2)
			elsif self.unit == "g" || self.unit == "ml"
				weight.to_i
			else
				weight.round(2)
			end
		else
			self.weight
		end
	end

	def perfect_unit
		weight = self.weight * self.quantity_wanted / self.recipe.recipe_weight
		if ((self.unit == "kg" || self.unit == "Kg") && weight < 1)
			'g'
		elsif ((self.unit == "L" || self.unit == "Litre") && weight < 1)
			"ml"
		elsif ((self.unit == "g" || self.unit == "grammes") && weight > 9999)
			'kg'
		elsif (self.unit == "ml" && weight > 9999)
			"L"
		else
			self.unit
		end
	end

	def perfect_array(value)
			balance = self.recipe.array_unit == "Kg" ? self.weight * 1000 : self.weight
			weight = balance * value / self.recipe.recipe_weight
			if ((self.unit == "kg" || self.unit == "Kg") && weight < 1)
				result = (balance * 1000 * value / self.recipe.recipe_weight).to_i
			elsif ((self.unit == "L" || self.unit == "Litre") && weight < 1)
				result = (balance * 1000 * value / self.recipe.recipe_weight).to_i
			elsif ((self.unit == "g" || self.unit == "grammes") && weight > 9999)
				result = (weight / 1000).round(2)
			elsif (self.unit == "ml" && weight > 9999)
				result = (weight / 1000).round(2)
			elsif self.unit == "g" || self.unit == "ml"
				result = weight.to_i
			else
				result = weight.round(2)
			end
	end

	def perfect_array_unit(value)
		balance = self.recipe.array_unit == "Kg" ? self.weight * 1000 : self.weight
		weight = balance * value / self.recipe.recipe_weight
		if ((self.unit == "kg" || self.unit == "Kg") && weight < 1)
			'g'
		elsif ((self.unit == "L" || self.unit == "Litre") && weight < 1)
			"ml"
		elsif ((self.unit == "g" || self.unit == "grammes") && weight > 9999)
			'kg'
		elsif (self.unit == "ml" && weight > 9999)
			"L"
		else
			self.unit
		end
	end

end

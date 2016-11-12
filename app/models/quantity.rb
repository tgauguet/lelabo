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

	def perfect_weight
		if self.recipe.unit == "parts"
			self.recipe.to_product ? ((self.weight * self.recipe.portion_weight.to_f / self.recipe.recipe_weight.to_f) * self.recipe.to_product.to_f).to_i : self.weight
		elsif self.recipe.unit == "#{self.recipe.portion_name}"
			self.recipe.to_product ? ((self.weight * self.recipe.portion.to_f / self.recipe.recipe_weight.to_f) * self.recipe.to_product.to_f).to_i : self.weight
		elsif self.recipe.unit == "recettes"
			self.recipe.to_product ? (((self.weight * self.recipe.totals.first.value.to_f / self.recipe.recipe_weight.to_f) * self.recipe.to_product.to_f) * 1000).to_i : self.weight
		elsif self.recipe.unit == "grammes"
			self.recipe.to_product ? (self.weight * self.recipe.to_product.to_f / self.recipe.recipe_weight.to_f).round(1) : self.weight
		elsif self.recipe.unit == "kilogrammes"
			self.recipe.to_product ? (self.weight.to_f * self.recipe.to_product.to_f / self.recipe.recipe_weight.to_f).round(3)  : self.weight
		else
			self.weight
		end
	end

end

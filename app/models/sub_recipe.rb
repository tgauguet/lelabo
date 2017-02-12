class SubRecipe < ActiveRecord::Base
  belongs_to :recipe

  def current_recipe
    Recipe.find(self.sub_id)
  end

  def find_recipe(value)
    Recipe.find(value)
  end

  def quantity_weight
    self.weight * self.quantity_wanted / self.recipe.recipe_weight
  end

  def perfect_weight
    if self.current_recipe.to_product
      quantity_weight > 9999 ? (quantity_weight / 1000).round(2) : quantity_weight.to_i
		else
			self.weight
		end
  end

  def perfect_unit
    quantity_weight > 9999 ? "Kg" : "g"
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

  def balance_calcul(value)
    balance = self.recipe.array_unit == "Kg" ? self.weight * 1000 : self.weight
    weight = balance * value / self.recipe.recipe_weight
  end

  def perfect_array(value)
		weight = balance_calcul(value)
		if weight > 9999
			(weight / 1000).round(2)
		else
			weight.to_i
		end
	end

	def perfect_array_unit(value)
		weight = balance_calcul(value)
		if weight > 9999
			'kg'
		else
			'g'
		end
	end

end

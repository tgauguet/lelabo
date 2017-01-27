module RecipesHelper

  def fat_color(recipe)
    if is_ganache?(recipe)
      recipe.percentage_of("fat_percent").between?(10, 20) ? "green" : "red"
    end
  end

  def sug_power_color(recipe)
    if is_ice_cream?(recipe)
      recipe.percentage_of("sugar_power").between?(16, 23) ? "green" : "red"
    elsif is_sorbet?(recipe)
      recipe.percentage_of("sugar_power").between?(25, 33) ? "green" : "red"
    end
  end

  def cocoa_butter_color(recipe)
    if is_ganache?(recipe)
      recipe.percentage_of("cocoa_butter_percent").between?(18,20) ? "green" : "red"
    end
  end

  def dry_matter_color(recipe)
    if is_ganache?(recipe)
      recipe.percentage_of("dry_matter_percent").between?(75, 82) ? "green" : "red"
    elsif is_ice_cream?(recipe)
      recipe.percentage_of("dry_matter_percent").between?(37, 42) ? "green" : "red"
    elsif is_sorbet?(recipe)
      recipe.percentage_of("dry_matter_percent").between?(29, 33) ? "green" : "red"
    end
  end

  def sugar_color(recipe)
    if is_ganache?(recipe)
      recipe.percentage_of("sugar_percent").between?(25, 30) ? "green" : "red"
    elsif is_ice_cream?(recipe)
      recipe.percentage_of("sugar_percent").between?(14, 26) ? "green" : "red"
    elsif is_sorbet?(recipe)
      recipe.percentage_of("sugar_percent").between?(18, 33) ? "green" : "red"
    end
  end

  def water_color(recipe)
    if is_ganache?(recipe)
      recipe.percentage_of("water_percent") <= 25 ? "green" : "red"
    end
  end

  def stab_color(recipe)
    recipe.percentage_of("stabilizer") <= 1 ? "green" : "red"
  end

  def milk_fat_color(recipe)
    recipe.milk_of("fat_percent").between?(8, 11) ? "green" : "red"
  end

  def milk_est_color(recipe)
    recipe.milk_of("dry_matter_percent") <= 10 ? "green" : "red"
  end

  def pulp_color(recipe)
    recipe.pulp_percentage >= 25 ? "green" : "red"
  end

  def milk_estmilk_color(recipe)
    recipe.milk_and_est(recipe).between?(16, 22) ? "green" : "red"
  end

  def is_ganache?(recipe)
    recipe.category == "Ganache"
  end

  def is_ice_cream?(recipe)
    recipe.category == "Glace"
  end

  def is_sorbet?(recipe)
    recipe.category == "Sorbet"
  end

  def recipe_price(quantity, recipe)
    if recipe.recipe_weight == 0
      0
    else
      quantity.ingredient.price * quantity.weight / 1000
    end
  end

end

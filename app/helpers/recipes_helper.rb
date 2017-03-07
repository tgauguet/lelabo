module RecipesHelper

  def red
    "#EF4836"
  end

  def green
    "#03C9A9"
  end

  def matter_color(recipe, matter)
    if is_ganache?(recipe)
      if matter == "mat. grasse"
        recipe.percentage_of("fat_percent").between?(10, 20) ? green : red
      elsif matter == "eau"
        recipe.percentage_of("water_percent") <= 25 ? green : red
      elsif matter == "beurre de cacao"
        recipe.percentage_of("cocoa_butter_percent").between?(18,20) ? green : red
      elsif matter == "mat. sèche"
        recipe.percentage_of("dry_matter_percent").between?(75, 82) ? green : red
      elsif matter == "sucre"
        recipe.percentage_of("sugar_percent").between?(25, 30) ? green : red
      else
        green
      end
    elsif is_ice_cream?(recipe)
      if matter == "pouvoir sucrant"
        recipe.percentage_of("sugar_power").between?(16, 23) ?  green : red
      elsif matter == "mat. sèche"
        recipe.percentage_of("dry_matter_percent").between?(37, 42) ? green : red
      elsif matter == "sucre"
        recipe.percentage_of("sugar_percent").between?(14, 26) ? green : red
      elsif matter == "mat. grasse du lait"
        recipe.milk_of("fat_percent").between?(8, 11) ? green : red
      elsif matter == "mat. sèche du lait"
        recipe.milk_of("dry_matter_percent").between?(37, 42) ? green : red
      elsif matter == "mat. gr & est du lait"
        recipe.milk_and_est(recipe).between?(16, 22) ? green : red
      elsif matter == "stabilisateur"
        recipe.percentage_of("stabilizer") <= 1 ? green : red
      else
        green
      end
    elsif is_sorbet?(recipe)
      if matter == "pouvoir sucrant"
        recipe.percentage_of("sugar_power").between?(25, 33) ? green : red
      elsif matter == "mat. sèche"
        recipe.percentage_of("dry_matter_percent").between?(29, 33) ? green : red
      elsif matter == "sucre"
        recipe.percentage_of("sugar_percent").between?(18, 33) ? green : red
      elsif matter == "stabilisateur"
        recipe.percentage_of("stabilizer") <= 1 ? green : red
      elsif matter == "pulpe de fruits"
        recipe.pulp_percentage >= 25 ? green : red
      else
        green
      end
    end
  end

  def wanted_percent(recipe, matter)
    if is_ganache?(recipe)
      if matter == "mat. grasse"
        "(10 - 20)"
      elsif matter == "eau"
        "MAX 25"
      elsif matter == "beurre de cacao"
        "(18 - 20)"
      elsif matter == "mat. sèche"
        "(75 - 82)"
      elsif matter == "sucre"
        "(25 - 30)"
      else
        " "
      end
    elsif is_ice_cream?(recipe)
      if matter == "pouvoir sucrant"
        "(16 - 23)"
      elsif matter == "mat. sèche"
        "(37 - 42)"
      elsif matter == "sucre"
        "(14 - 26)"
      elsif matter == "mat. grasse du lait"
        "(8 - 11)"
      elsif matter == "mat. sèche du lait"
        "(37 - 42)"
      elsif matter == "mat. gr & est du lait"
        "(16 - 22)"
      elsif matter == "stabilisateur"
        "(MAX 1)"
      else
        " "
      end
    elsif is_sorbet?(recipe)
      if matter == "pouvoir sucrant"
        "(25 - 33)"
      elsif matter == "mat. sèche"
        "(29 - 33)"
      elsif matter == "sucre"
        "(18 - 33)"
      elsif matter == "stabilisateur"
        "(MAX 1)"
      elsif matter == "pulpe de fruits"
        "(MIN 25)"
      else
        " "
      end
    end
  end

  def percentage_function(matter, value, recipe)
    if value == "mat. sèche du lait"
      recipe.milk_of("dry_matter_percent").to_i
    elsif value == "mat. grasse du lait"
      recipe.milk_of("fat_percent").to_i
    elsif value == "mat. gr & est du lait"
      recipe.milk_and_est(recipe).to_i
    elsif value == "pulpe de fruits"
      recipe.pulp_percentage.to_i
    else
      recipe.percentage_of(matter).to_i
    end
  end

  def is_ganache?(recipe)
    recipe.eq_data == "Ganache"
  end

  def is_ice_cream?(recipe)
    recipe.eq_data == "Glace"
  end

  def is_sorbet?(recipe)
    recipe.eq_data == "Sorbet"
  end

  def is_barcode?(value)
    value && Math.log10(value).to_i == 11
  end

  def recipe_price(quantity, recipe)
    if recipe.recipe_weight == 0
      0
    else
      quantity.ingredient.price * quantity.quantity_weight / 1000
    end
  end

  def sub_price(subr, recipe)
    if recipe.recipe_weight == 0
      0
    else
      subr.current_recipe.kilo_cost * subr.weight / 1000
    end
  end

end

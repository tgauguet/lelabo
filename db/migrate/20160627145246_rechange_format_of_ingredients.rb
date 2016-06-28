class RechangeFormatOfIngredients < ActiveRecord::Migration
  def change
  	execute %Q{
  		update ingredients
  		set price = null
  	}
  	execute 'ALTER TABLE ingredients ALTER COLUMN price TYPE decimal(9,2) USING (price::decimal(9,2))'
  end
end

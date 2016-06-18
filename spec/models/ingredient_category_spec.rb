require 'rails_helper'

RSpec.describe IngredientCategory, type: :model do
  it "belongs_to ingredients" do
  	IngredientCategory.reflect_on_association(:ingredient).macro.should eq(:belongs_to)
  end
end

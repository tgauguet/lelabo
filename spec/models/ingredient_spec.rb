require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  
  it "expect Ingredients to belongs to user" do
  	Ingredient.reflect_on_association(:user).macro.should eq(:belongs_to)
  end
  
end

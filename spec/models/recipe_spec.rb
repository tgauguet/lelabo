require 'rails_helper'

RSpec.describe Recipe, type: :model do

  it "expect uniqueness of it's name" do
  	recipe1 = FactoryGirl.create(:recipe, name: "recipe1")
  	recipe2 = FactoryGirl.create(:recipe, name: "recipe1")
  	expect(recipe1).to be_valid
  	expect(recipe2).to be_invalid
  end

  it "expect recipes to belongs_to user" do
  	Recipe.reflect_on_association(:user).macro.should eq(:belongs_to)
  end

  it "expect to has_many ingredients" do
  	Recipe.reflect_on_association(:ingredients).macro.should eq(:has_many)
  end

  it "expect to validates presence of name" do
  	expect(build(:recipe, name: nil)).to be_invalid
  end

  it "expect to validates presence of user" do
  	expect(build(:recipe, user_id: nil)).to be_invalid
  end

end

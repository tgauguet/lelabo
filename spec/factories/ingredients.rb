FactoryGirl.define do
  factory :ingredient do
    price "10,00"
    name "Farine"
    quantity "0.3"
    recipe_id 1
    unit "Kilos"
  end
end

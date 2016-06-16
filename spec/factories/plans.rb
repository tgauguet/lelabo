FactoryGirl.define do
  factory :plan do
    stripe_id "2"
    name "Basic Plan"
    description "ceci est un plan vraiment basique"
    amount 1
    interval "month"
    published true
  end
end

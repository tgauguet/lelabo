namespace :plan do
	task :create_plan => :environment do
		Plan.create!(name: "BASIC", amount: 000, published: true, price: 000)
		CreatePlan.call(name: "PRO", amount: 13200, published: true, interval: 'year', trial_period_days: '14', stripe_id: "PRO", price: 11)
		CreatePlan.call(name: "ENTREPRISE", amount: 22800, published: true, interval: 'year', trial_period_days: '14', stripe_id: "BUSINESS", price: 19)
	end
	task :create_promo_plan => :environment do
		CreatePlan.call(name: "PRO", amount: 10560, published: true, interval: 'year', trial_period_days: '14', stripe_id: "2PRO", price: 8.80)
		CreatePlan.call(name: "ENTREPRISE", amount: 18240, published: true, interval: 'year', trial_period_days: '14', stripe_id: "2BUSINESS", price: 15.20)
	end
	task :create_life_plan => :environment do
		CreatePlan.call(name: "LIFE", amount: 119900, published: true, interval: "year", trial_period_days: '14', stripe_id: 'LIFE', price: 1199.00)
	end
end

namespace :plan do
	task :create_plan => :environment do
		Plan.create!(name: "BASIC", amount: 000, published: true, price: 000)
		CreatePlan.call(name: "PRO", amount: 13200, published: true, interval: 'year', trial_period_days: '14', stripe_id: "PRO", price: 11)
		CreatePlan.call(name: "ENTREPRISE", amount: 22800, published: true, interval: 'year', trial_period_days: '14', stripe_id: "BUSINESS", price: 19)
	end
end

namespace :plan do
	task :create_plan => :environment do
		Plan.create!(name: "BASIC", amount: 000, published: true, price: 000)
		CreatePlan.call(name: "PRO", amount: 7140, published: true, interval: 'year', trial_period_days: '14', stripe_id: "PRO", price: 595)
		CreatePlan.call(name: "ENTREPRISE", amount: 11940, published: true, interval: 'year', trial_period_days: '14', stripe_id: "BUSINESS", price: 995)
	end
end
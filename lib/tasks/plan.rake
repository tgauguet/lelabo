namespace :plan do
	task :create_plan => :environment do
		Plan.create!(name: "BASIC", amount: 000, published: true)
		CreatePlan.call(name: "PRO", amount: 595, published: true, interval: 'month', trial_period_days: '14', stripe_id: "PRO")
		CreatePlan.call(name: "ENTREPRISE", amount: 995, published: true, interval: 'month', trial_period_days: '14', stripe_id: "BUSINESS")
	end
end
module SubscriptionsHelper

	def basic_plan(plan)
		plan.name == "BASIC"
	end

	def pro_plan(plan)
		plan.stripe_id == "PRO"
	end

	def entreprise_plan(plan)
		plan.stripe_id == "BUSINESS"
	end

	def user_with_no_subscription(user)
		user && !user.subscription.nil?
	end

	def same_plan_id(user, plan)
		user.subscription.plan && user.subscription.plan_id == plan.id
	end

	def user_have_basic_plan(user)
		user.subscription.plan && user.subscription.plan.name == "BASIC"
	end
end

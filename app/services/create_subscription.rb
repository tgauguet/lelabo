class CreateSubscription

	def self.call(plan, email_address, token)
		user, raw_token = CreateUser.call(email_address)
		#user = User.find_by(email: email_address)

		subscription = Subscription.new(
			plan: plan,
			user: user
		)

		begin
			stripe_sub = nil
			if !user.stripe_customer_id?
				customer = Stripe::Customer.create(
					source: token,
					email: user.email,
					plan: plan.stripe_id,
				)

				user.stripe_customer_id = customer.id
				user.save!
				stripe_sub = customer.subscriptions.first
			else
				#new_plan = plan
				#subscription = user.subscription
				#stripe_sub = ChangePlan.call(subscription, new_plan)
			end

			subscription.stripe_id = stripe_sub.id

			subscription.save!
		rescue Stripe::StripeError => e
			subscription.errors[:base] << e.message
		end
		subscription
	end
end
